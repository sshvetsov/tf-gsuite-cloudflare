provider "cloudflare" {}

/*
Zone apex A records
*/
resource "cloudflare_record" "apex" {
  domain  = "${var.domain_name}"
  name    = "${var.domain_name}"
  value   = "${var.redirect_apex ? element(var.apex_redirect_values, count.index) : element(var.apex_values, count.index) }"
  type    = "A"
  proxied = "${var.redirect_apex ? false : var.apex_is_proxied}"
  ttl     = "${element(var.apex_ttls, count.index)}"
  count   = "${var.redirect_apex ? length(var.apex_redirect_values) : length(compact(var.apex_values))}"
}

/*
WWW records
*/
resource "cloudflare_record" "www" {
  domain  = "${var.domain_name}"
  name    = "www"
  value   = "${var.redirect_www_to_apex ? var.domain_name : element(var.www_values, count.index)}"
  type    = "${var.redirect_www_to_apex ? "CNAME" : var.www_type}"
  proxied = "${var.redirect_www_to_apex ? false : var.www_is_proxied}"
  ttl     = "${element(var.www_ttls, count.index)}"
  count   = "${var.redirect_www_to_apex ? 1 : length(compact(var.www_values))}"
}

/*
MX records
*/
resource "cloudflare_record" "mx" {
  domain   = "${var.domain_name}"
  name     = "${var.domain_name}"
  value    = "${var.use_default_mx_records ? element(var.default_mx_values, count.index) : element(var.custom_mx_values, count.index)}"
  type     = "MX"
  ttl      = "${var.use_default_mx_records ? element(var.default_mx_ttls, count.index) : element(var.custom_mx_ttls, count.index)}"
  priority = "${var.use_default_mx_records ? element(var.default_mx_priorities, count.index) : element(var.custom_mx_priorities, count.index)}"
  count    = "${var.use_default_mx_records ? length(var.default_mx_values) : length(compact(var.custom_mx_values))}"
}

/*
SPF record
*/
resource "cloudflare_record" "spf" {
  domain = "${var.domain_name}"
  name   = "${var.domain_name}"
  value  = "${var.use_default_spf_record ? var.default_spf_value : var.custom_spf_value}"
  type   = "TXT"
  count  = "${var.use_default_spf_record ? 1 : length(var.custom_spf_value) == 0 ? 0 : 1}"
}

/*
DKIM record
*/
resource "cloudflare_record" "dkim" {
  domain = "${var.domain_name}"
  name   = "google._domainkey"
  value  = "${var.dkim_value}"
  type   = "TXT"
  count  = "${length(var.dkim_value) == 0 ? 0 : 1}"
}

/*
Common G Suite App CNAMEs
*/
resource "cloudflare_record" "app_cname" {
  domain = "${var.domain_name}"
  name   = "${element(var.app_cname_names, count.index)}"
  value  = "ghs.googlehosted.com"
  type   = "CNAME"
  count  = "${var.create_app_cname_records ? length(var.app_cname_names) : 0}"
}

/*
Custom CNAMEs
*/
resource "cloudflare_record" "custom_cname" {
  domain  = "${var.domain_name}"
  name    = "${element(var.custom_cname_names, count.index)}"
  value   = "${element(var.custom_cname_values, count.index)}"
  type    = "CNAME"
  ttl     = "${element(var.custom_cname_ttls, count.index)}"
  proxied = "${element(var.custom_cname_is_proxied, count.index)}"
  count   = "${length(var.custom_cname_names)}"
}
