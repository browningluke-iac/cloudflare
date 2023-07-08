resource "cloudflare_filter" "firewall_filter" {
  for_each = { for each in var.rules : each.friendly_name => each }

  zone_id = var.cloudflare_zone_id

  expression  = each.value.filter.expression
  description = each.value.filter.description
}

resource "cloudflare_firewall_rule" "firewall_rule" {
  for_each = { for each in var.rules : each.friendly_name => each }

  zone_id = var.cloudflare_zone_id

  filter_id = cloudflare_filter.firewall_filter[each.key].id
  action    = each.value.action
  paused    = !each.value.enabled

  description = each.value.description
  priority    = each.value.priority
}
