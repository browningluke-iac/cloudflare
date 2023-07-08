resource "cloudflare_ruleset" "transform_rewrite_url" {
  zone_id = var.cloudflare_zone_id

  kind  = "zone"
  phase = "http_request_transform"
  name  = "Transform Rules"

  dynamic "rules" {
    for_each = var.rules.rewrite_url

    content {
      enabled = rules.value.enabled
      action  = "rewrite"

      description = rules.value.name
      expression  = rules.value.expression

      action_parameters {
        uri {
          dynamic "path" {
            for_each = rules.value.path != null ? [rules.value.path] : []

            content {
              expression = path.value.dynamic ? path.value.value : null
              value      = path.value.dynamic ? null : path.value.value
            }
          }

          dynamic "query" {
            for_each = rules.value.query != null ? [rules.value.query] : []

            content {
              expression = query.value.dynamic ? query.value.value : ""
              value      = query.value.dynamic ? "" : query.value.value
            }
          }
        }
      }
    }
  }
}
