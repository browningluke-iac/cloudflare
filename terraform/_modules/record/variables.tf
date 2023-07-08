variable "cloudflare_zone_id" {
  type = string
}

variable "records" {
  description = "list of dns records"
  type = list(object({
    friendly_name = string
    name          = string
    type          = string
    proxied       = optional(bool, true)
    ttl           = optional(number, 1)

    data = object({
      value    = string
      priority = optional(number, null)
    })

    comment = optional(string, "")
  }))
  nullable = false
}
