resource "cloudflare_page_rule" "page_rule" {
  for_each = { for each in var.rules : each.friendly_name => each }

  zone_id = var.cloudflare_zone_id

  target   = each.value.target
  priority = each.value.priority

  status = each.value.enabled ? "active" : "disabled"

  actions {
    cache_level    = each.value.actions.cache_level
    edge_cache_ttl = each.value.actions.edge_cache_ttl
  }
}
