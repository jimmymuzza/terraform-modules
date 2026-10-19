resource "aws_lightsail_domain" "lightsail_domains" {
  for_each = var.lightsail_domains

  domain_name = each.value.domain_name
  region      = each.value.region
}
