locals {
  rules_page_yaml = yamldecode(var.config)
  rules_page      = { for each in local.rules_page_yaml : each.friendly_name => each }
}

resource "cloudflare_page_rule" "page_rule" {
  for_each = local.rules_page

  zone_id = var.cloudflare_zone_id

  target   = each.value.target
  priority = each.value.priority

  status = lookup(each.value, "enabled", true) ? "active" : "disabled"

  actions {
    cache_level    = can(each.value.actions.cache_level) ? each.value.actions.cache_level : null
    edge_cache_ttl = can(each.value.actions.edge_cache_ttl) ? each.value.actions.edge_cache_ttl : null
  }
}
