resource "aws_elasticache_user_group_association" "elasticache_user_group_associations" {
  for_each = var.elasticache_user_group_associations

  user_group_id = each.value.user_group_id
  user_id       = each.value.user_id
  region        = each.value.region
}
