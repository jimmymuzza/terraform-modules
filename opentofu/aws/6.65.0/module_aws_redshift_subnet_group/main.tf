resource "aws_redshift_subnet_group" "redshift_subnet_groups" {
  for_each = var.redshift_subnet_groups

  name        = each.value.name
  subnet_ids  = each.value.subnet_ids
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
