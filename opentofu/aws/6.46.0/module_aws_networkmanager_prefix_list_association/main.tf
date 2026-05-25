resource "aws_networkmanager_prefix_list_association" "networkmanager_prefix_list_associations" {
  for_each = var.networkmanager_prefix_list_associations

  core_network_id   = each.value.core_network_id
  prefix_list_alias = each.value.prefix_list_alias
  prefix_list_arn   = each.value.prefix_list_arn
}
