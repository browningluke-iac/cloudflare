variable "cloudflare_account_id" {
  type = string
}

variable "rules" {
  description = "list of redirects"
  type = list(object({
    name        = string
    description = optional(string, "")
    enabled     = optional(bool, true)

    items = list(object({
      name        = string
      source      = string
      target      = string
      status_code = optional(number, 301)

      parameters = object({
        subpath_matching      = optional(bool, false)
        include_subdomains    = optional(bool, false)
        preserve_path_suffix  = optional(bool, false)
        preserve_query_string = optional(bool, false)
      })
    }))
  }))
  nullable = false
}
