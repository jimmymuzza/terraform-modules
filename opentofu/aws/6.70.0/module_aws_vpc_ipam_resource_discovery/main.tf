resource "aws_vpc_ipam_resource_discovery" "vpc_ipam_resource_discoveries" {
  for_each = var.vpc_ipam_resource_discoveries

  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "operating_regions" {
    for_each = each.value.operating_regions != null ? each.value.operating_regions : []
    content {
      region_name = operating_regions.value.region_name
    }
  }

  dynamic "organizational_unit_exclusion" {
    for_each = each.value.organizational_unit_exclusion != null ? each.value.organizational_unit_exclusion : []
    content {
      organizations_entity_path = organizational_unit_exclusion.value.organizations_entity_path
    }
  }
}
