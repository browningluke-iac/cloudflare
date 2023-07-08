resource "cloudflare_list" "redirect_list" {
  for_each = { for each in var.rules : each.name => each }

  account_id = var.cloudflare_account_id

  name        = each.value.name
  description = each.value.description
  kind        = "redirect"

  dynamic "item" {
    for_each = each.value.items

    content {
      comment = item.value.name

      value {
        redirect {
          source_url = item.value.source
          target_url = item.value.target

          status_code = item.value.status_code

          include_subdomains    = item.value.parameters.include_subdomains ? "enabled" : "disabled"
          subpath_matching      = item.value.parameters.subpath_matching ? "enabled" : "disabled"
          preserve_path_suffix  = item.value.parameters.preserve_path_suffix ? "enabled" : "disabled"
          preserve_query_string = item.value.parameters.preserve_query_string ? "enabled" : "disabled"
        }
      }
    }
  }
}

resource "cloudflare_ruleset" "redirect_rule" {
  account_id = var.cloudflare_account_id

  kind  = "root"
  phase = "http_request_redirect"
  name  = "Redirect Rules"

  dynamic "rules" {
    for_each = { for each in var.rules : each.name => each }

    content {
      enabled = rules.value.enabled
      action  = "redirect"

      description = "Apply redirects from ${rules.value.name}"
      expression  = "http.request.full_uri in ${"$"}${rules.value.name}"

      action_parameters {
        from_list {
          name = rules.value.name
          key  = "http.request.full_uri"
        }
      }
    }
  }
}
