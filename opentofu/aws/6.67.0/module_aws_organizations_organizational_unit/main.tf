resource "aws_organizations_organizational_unit" "organizations_organizational_units" {
  for_each = var.organizations_organizational_units

  name      = each.value.name
  parent_id = each.value.parent_id
  tags      = each.value.tags
  tags_all  = each.value.tags_all
}
