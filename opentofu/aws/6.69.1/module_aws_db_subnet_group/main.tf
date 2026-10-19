resource "aws_db_subnet_group" "db_subnet_groups" {
  for_each = var.db_subnet_groups

  subnet_ids  = each.value.subnet_ids
  description = each.value.description
  name        = each.value.name
  name_prefix = each.value.name_prefix
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
