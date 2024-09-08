<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_acme"></a> [acme](#requirement\_acme) | 2.26.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.5.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_acme"></a> [acme](#provider\_acme) | 2.26.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [acme_certificate.certificate](https://registry.terraform.io/providers/vancluever/acme/2.26.0/docs/resources/certificate) | resource |
| [acme_registration.reg](https://registry.terraform.io/providers/vancluever/acme/2.26.0/docs/resources/registration) | resource |
| [local_sensitive_file.le_fullchain](https://registry.terraform.io/providers/hashicorp/local/2.5.1/docs/resources/sensitive_file) | resource |
| [local_sensitive_file.le_privkey](https://registry.terraform.io/providers/hashicorp/local/2.5.1/docs/resources/sensitive_file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acme"></a> [acme](#input\_acme) | n/a | <pre>object({<br>    email       = optional(string)<br>    cf_api_key  = optional(string)<br>    common_name = optional(string)<br>    sans        = optional(list(string))<br>    provider    = optional(string)<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->