resource "aws_connect_user_hierarchy_group" "connect_user_hierarchy_groups" {
  for_each = var.connect_user_hierarchy_groups

  instance_id     = each.value.instance_id
  name            = each.value.name
  parent_group_id = each.value.parent_group_id
  region          = each.value.region
  tags            = each.value.tags
  tags_all        = each.value.tags_all
}
