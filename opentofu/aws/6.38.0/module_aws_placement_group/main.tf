resource "aws_placement_group" "placement_groups" {
  for_each = var.placement_groups

  name            = each.value.name
  strategy        = each.value.strategy
  partition_count = each.value.partition_count
  region          = each.value.region
  spread_level    = each.value.spread_level
  tags            = each.value.tags
  tags_all        = each.value.tags_all
}
