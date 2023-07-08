# Cloudflare Redirect Rule Module

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.7 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_list.redirect_list](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/list) | resource |
| [cloudflare_ruleset.redirect_rule](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/ruleset) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_account_id"></a> [cloudflare\_account\_id](#input\_cloudflare\_account\_id) | n/a | `string` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | list of redirects | <pre>list(object({<br>    name        = string<br>    description = optional(string, "")<br>    enabled     = optional(bool, true)<br><br>    items = list(object({<br>      name        = string<br>      source      = string<br>      target      = string<br>      status_code = optional(number, 301)<br><br>      parameters = object({<br>        subpath_matching      = optional(bool, false)<br>        include_subdomains    = optional(bool, false)<br>        preserve_path_suffix  = optional(bool, false)<br>        preserve_query_string = optional(bool, false)<br>      })<br>    }))<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
