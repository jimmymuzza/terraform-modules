resource "aws_elasticache_user_group" "elasticache_user_groups" {
  for_each = var.elasticache_user_groups

  engine        = each.value.engine
  user_group_id = each.value.user_group_id
  region        = each.value.region
  tags          = each.value.tags
  tags_all      = each.value.tags_all
  user_ids      = each.value.user_ids
}
