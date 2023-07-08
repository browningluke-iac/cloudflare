variable "cloudflare_zone_id" {
  type = string
}

variable "rules" {
  description = "transform rules"
  type = object({
    rewrite_url = list(object({
      name       = string
      enabled    = optional(bool, true)
      expression = string

      path = optional(object({
        value   = string
        dynamic = optional(bool, false)
      }), null)

      query = optional(object({
        value   = string
        dynamic = optional(bool, false)
      }), null)
    }))
  })
  nullable = false
}
