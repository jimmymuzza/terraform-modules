resource "aws_elasticache_subnet_group" "elasticache_subnet_groups" {
  for_each = var.elasticache_subnet_groups

  name        = each.value.name
  subnet_ids  = each.value.subnet_ids
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
