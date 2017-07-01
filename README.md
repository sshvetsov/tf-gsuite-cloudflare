# G Suite Cloudflare Terraform Module

This terraform module makes it easy to create and manage common DNS records used by G Suite, f.k.a. Google Apps for Domain, in your Cloudflare account.

## Examples

In order to use Cloudflare API, pass your email and API token as environment variables:

```
export CLOUDFLARE_EMAIL=your@email.com
export CLOUDFLARE_TOKEN=1234secret0token56789
```

### No records created by default
```
module "test_domain" {
    source = "github.com/sshvetsov/tf-gsuite-cloudflare"
    domain_name = "viragedanceco.com"
}
```

### Create default MX records only
```
module "test_domain" {
    source = "github.com/sshvetsov/tf-gsuite-cloudflare"
    domain_name = "viragedanceco.com"

    use_default_mx_records = true
}
```

### Create default MX and SPF records
```
module "test_domain" {
    source = "github.com/sshvetsov/tf-gsuite-cloudflare"
    domain_name = "viragedanceco.com"

    use_default_mx_records = true
    use_default_spf_record = true
}
```

### Create default MX, SPF records and add DKIM key
```
module "test_domain" {
    source = "github.com/sshvetsov/tf-gsuite-cloudflare"
    domain_name = "viragedanceco.com"

    use_default_mx_records = true
    use_default_spf_record = true
    dkim_value = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA..."
}
```

### Create common App CNAME records (mail, calendar, drive)
```
module "test_domain" {
    source = "github.com/sshvetsov/tf-gsuite-cloudflare"
    domain_name = "viragedanceco.com"

    create_app_cname_records = true
}
```

### Create custom App CNAME records
```
module "test_domain" {
    source = "github.com/sshvetsov/tf-gsuite-cloudflare"
    domain_name = "viragedanceco.com"

    create_app_cname_records = true
    app_cname_names = [
        "webmail",
        "cal",
        "docs",
        "pages",
    ]
}
```

### Create apex and www records where www.viragedanceco.com --> viragedanceco.com
```
module "test_domain" {
    source = "github.com/sshvetsov/tf-gsuite-cloudflare"
    domain_name = "viragedanceco.com"

    apex_values = ["127.0.0.1"]
    redirect_www_to_apex = true
}
```

### Create apex and www records where viragedanceco.com --> ???.viragedanceco.com (eg. www)
```
module "test_domain" {
    source = "github.com/sshvetsov/tf-gsuite-cloudflare"
    domain_name = "viragedanceco.com"

    www_values = ["127.0.0.1"]
    apex_redirect_is_enabled = true
}
```