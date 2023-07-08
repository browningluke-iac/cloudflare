variable "cloudflare_zone_id" {
  type = string
}

variable "config" {
  description = "yaml data defining firewall rules"
  type        = string
}
