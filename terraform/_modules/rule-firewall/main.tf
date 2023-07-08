locals {
  rules_firewall_yaml = yamldecode(var.config)
  rules_firewall      = { for each in local.rules_firewall_yaml : each.friendly_name => each }
}

resource "cloudflare_filter" "firewall_filter" {
  for_each = local.rules_firewall

  zone_id = var.cloudflare_zone_id

  expression  = each.value.filter.expression
  description = lookup(each.value.filter, "description", "")
}

resource "cloudflare_firewall_rule" "firewall_rule" {
  for_each = local.rules_firewall

  zone_id = var.cloudflare_zone_id

  filter_id = cloudflare_filter.firewall_filter[each.key].id
  action    = lookup(each.value, "action", "block")
  paused    = !lookup(each.value, "enabled", true)

  description = lookup(each.value, "description", "")
  priority    = lookup(each.value, "priority", null)
}
