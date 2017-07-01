variable "domain_name" {
  type        = "string"
  description = "(Required) The G Suite domain being managed."
}

/* Domain Apex Records */
variable "apex_redirect_is_enabled" {
  type        = "string"
  description = "(Optional) Whether zone apex redirection should be enabled."
  default     = false
}

variable "apex_redirect_values" {
  type        = "list"
  description = "List of ghs redirection IPs to point zone apex to."

  default = [
    "216.239.32.21",
    "216.239.34.21",
    "216.239.36.21",
    "216.239.38.21",
  ]
}

variable "apex_values" {
  type        = "list"
  description = "(Optional) List of IPs to point zone apex to."
  default     = []
}

variable "apex_is_proxied" {
  type        = "string"
  description = "(Optional) Whether zone apex records is proxied via Cloudflare."
  default     = ""
}

variable "apex_ttls" {
  type        = "list"
  description = "(Optional) List of TTL values to assign to zone apex A records."
  default     = [1]
}

/* WWW Records */
variable "redirect_www_to_apex" {
  type        = "string"
  description = "(Optional) Whether to redirect www to zone apex."
  default     = false
}

variable "www_values" {
  type        = "list"
  description = "(Optional) List of destinations to point www records to."
  default     = []
}

variable "www_type" {
  type        = "string"
  description = "(Optional) record type for www."
  default     = "A"
}

variable "www_is_proxied" {
  type        = "string"
  description = "(Optional) whether www records are proxied via Cloudflare."
  default     = ""
}

variable "www_ttls" {
  type        = "list"
  description = "(Optional) List of TTL values to assign to www records."
  default     = [1]
}

/* Default MX Records */
variable "use_default_mx_records" {
  type        = "string"
  description = "(Optional) Whether default MX records should be used."
  default     = false
}

variable "default_mx_values" {
  type        = "list"
  description = "List of default hostnames used for MX records."

  default = [
    "aspmx.l.google.com",
    "alt1.aspmx.l.google.com",
    "alt2.aspmx.l.google.com",
    "alt3.aspmx.l.google.com",
    "alt4.aspmx.l.google.com",
  ]
}

variable "default_mx_priorities" {
  type        = "list"
  description = "List of default priorities associated with default MX hostnames."
  default     = ["1", "5", "5", "10", "10"]
}

variable "default_mx_ttls" {
  type        = "list"
  description = "List of TTL values assigned to default MX records."
  default     = [3600]
}

/* Custom MX Records */
variable "custom_mx_values" {
  type        = "list"
  description = "(Optional) List of hostnames to use for custom MX records."
  default     = []
}

variable "custom_mx_priorities" {
  type        = "list"
  description = "(Optional) List of priorities associated with MX hostnames."
  default     = []
}

variable "custom_mx_ttls" {
  type        = "list"
  description = "(Optional) List of TTL values to assign to MX records."
  default     = [3600]
}

/* SPF Records */
variable "use_default_spf_record" {
  type        = "string"
  description = "(Optional) Whether default SPF record should be used."
  default     = false
}

variable "default_spf_value" {
  type        = "string"
  description = "Default value of the SPF TXT record."
  default     = "v=spf1 include:_spf.google.com ~all"
}

variable "custom_spf_value" {
  type        = "string"
  description = "(Optional) Custom value for SPF TXT record."
  default     = ""
}

/* DKIM Records */
variable "dkim_value" {
  type        = "string"
  description = "(Optional) Value of the DKIM TXT record."
  default     = ""
}

/* App CNAME Records */
variable "create_app_cname_records" {
  type        = "string"
  descritpion = "(Optional) Whether common G Suite App CNAME records should be created."
  default     = false
}

variable "app_cname_names" {
  type        = "list"
  description = "(Optional) List of G Suite App CNAME record names."

  default = [
    "mail",
    "drive",
    "calendar",
  ]
}

variable "app_cname_values" {
  type        = "list"
  description = "(Optional) List of G Suite App CNAME record values."
  default     = ["ghs.googlehosted.com"]
}

variable "app_cname_ttls" {
  type        = "list"
  description = "(Optional) List of TTL values to assign to G Suite App CNAME records."
  default     = [1]
}

/* Custom CNAME Records */
variable "custom_cname_names" {
  type        = "list"
  description = "(Optional) List of custom CNAME record names."
  default     = []
}

variable "custom_cname_values" {
  type        = "list"
  description = "(Optional) List of custom CNAME record values."
  default     = []
}

variable "custom_cname_ttls" {
  type        = "list"
  description = "(Optional) List of TTL values to assign to custom CNAME records."
  default     = [1]
}

variable "custom_cname_is_proxied" {
  type        = "list"
  description = "(Optional) whether custom CNAME records should be proxied via Cloudflare."
  default     = [""]
}
