variable "cloudflare_zone_id" {
  type = string
}

variable "rules" {
  description = "list of page rules"
  type = list(object({
    friendly_name = string
    target        = string
    priority      = number
    enabled       = optional(bool, true)

    actions = object({
      cache_level    = optional(string, null)
      edge_cache_ttl = optional(number, null)
    })
  }))
  nullable = false
}
