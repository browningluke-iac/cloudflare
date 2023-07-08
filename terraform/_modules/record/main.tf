resource "cloudflare_record" "record" {
  for_each = { for each in var.records : each.friendly_name => each }

  zone_id = var.cloudflare_zone_id

  # Record
  name = each.value.name
  type = each.value.type

  proxied = each.value.proxied
  ttl     = each.value.ttl

  value    = each.value.data.value
  priority = each.value.data.priority

  # Meta
  comment = each.value.comment
}
