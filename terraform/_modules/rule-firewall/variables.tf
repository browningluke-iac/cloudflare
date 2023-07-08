variable "cloudflare_zone_id" {
  type = string
}

variable "rules" {
  description = "list of firewall rules"
  type = list(object({
    friendly_name = string
    enabled       = optional(bool, true)
    description   = optional(string, "")
    action        = optional(string, "block")
    priority      = optional(number, null)

    filter = object({
      expression  = string
      description = optional(string, "")
    })
  }))
  nullable = false
}
