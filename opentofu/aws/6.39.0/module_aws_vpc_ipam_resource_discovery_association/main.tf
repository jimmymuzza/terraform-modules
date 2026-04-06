resource "aws_vpc_ipam_resource_discovery_association" "vpc_ipam_resource_discovery_associations" {
  for_each = var.vpc_ipam_resource_discovery_associations

  ipam_id                    = each.value.ipam_id
  ipam_resource_discovery_id = each.value.ipam_resource_discovery_id
  region                     = each.value.region
  tags                       = each.value.tags
  tags_all                   = each.value.tags_all
}
