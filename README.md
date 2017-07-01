# G Suite Cloudflare Terraform Module

This terraform module makes it easy to create and manage common DNS records used by G Suite, f.k.a. Google Apps for Domain, in your Cloudflare account.

## Usage

In order to use Cloudflare API, pass your email and API token as environment variables:

```
export CLOUDFLARE_EMAIL=your@email.com
export CLOUDFLARE_TOKEN=1234secret0token56789
```

See `tests/main.tf.sample` for detailed usage eaxmples