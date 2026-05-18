resource "aws_lightsail_domain_entry" "lightsail_domain_entries" {
  for_each = var.lightsail_domain_entries

  domain_name = each.value.domain_name
  name        = each.value.name
  target      = each.value.target
  type        = each.value.type
  is_alias    = each.value.is_alias
  region      = each.value.region
}
