locals {
  env = "browningluke.dev"
}

# DNS Records
module "cf_record" {
  source = "../_modules/record"

  cloudflare_zone_id = var.cloudflare_zone_id

  config = file("${path.module}/../../data/${local.env}/dns.yaml")
}

# Transform Rules
module "cf_rule_transform" {
  source = "../_modules/rule-transform"

  cloudflare_zone_id = var.cloudflare_zone_id

  config = file("${path.module}/../../data/${local.env}/rules_transform.yaml")
}

# Page Rules
module "cf_rule_page" {
  source = "../_modules/rule-page"

  cloudflare_zone_id = var.cloudflare_zone_id

  config = file("${path.module}/../../data/${local.env}/rules_page.yaml")
}

# Bulk Redirects
module "cf_rule_redirect" {
  source = "../_modules/rule-redirect"

  cloudflare_account_id = var.cloudflare_account_id

  config = file("${path.module}/../../data/${local.env}/rules_redirect.yaml")
}

# Firewall Rules
module "cf_rule_firewall" {
  source = "../_modules/rule-firewall"

  cloudflare_zone_id = var.cloudflare_zone_id

  config = file("${path.module}/../../data/${local.env}/rules_firewall.yaml")
}
