resource "aws_verifiedaccess_instance" "verifiedaccess_instances" {
  for_each = var.verifiedaccess_instances

  cidr_endpoints_custom_subdomain = each.value.cidr_endpoints_custom_subdomain
  description                     = each.value.description
  fips_enabled                    = each.value.fips_enabled
  region                          = each.value.region
  tags                            = each.value.tags
  tags_all                        = each.value.tags_all
}
