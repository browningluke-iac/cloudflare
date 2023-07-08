locals {
  env = "browningluke.dev"

  data_path = "${path.module}/../../data/${local.env}"
}

# DNS Records
module "cf_record" {
  source = "../_modules/record"

  cloudflare_zone_id = var.cloudflare_zone_id

  records = yamldecode(file("${local.data_path}/dns.yaml"))
}

# Transform Rules
module "cf_rule_transform" {
  source = "../_modules/rule-transform"

  cloudflare_zone_id = var.cloudflare_zone_id

  rules = yamldecode(file("${local.data_path}/rules_transform.yaml"))
}

# Page Rules
module "cf_rule_page" {
  source = "../_modules/rule-page"

  cloudflare_zone_id = var.cloudflare_zone_id

  rules = yamldecode(file("${local.data_path}/rules_page.yaml"))
}

# Bulk Redirects
module "cf_rule_redirect" {
  source = "../_modules/rule-redirect"

  cloudflare_account_id = var.cloudflare_account_id

  rules = yamldecode(file("${local.data_path}/rules_redirect.yaml"))
}

# Firewall Rules
module "cf_rule_firewall" {
  source = "../_modules/rule-firewall"

  cloudflare_zone_id = var.cloudflare_zone_id

  rules = yamldecode(file("${local.data_path}/rules_firewall.yaml"))
}
