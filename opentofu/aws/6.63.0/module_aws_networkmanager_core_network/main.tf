resource "aws_networkmanager_core_network" "networkmanager_core_networks" {
  for_each = var.networkmanager_core_networks

  global_network_id    = each.value.global_network_id
  base_policy_document = each.value.base_policy_document
  base_policy_regions  = each.value.base_policy_regions
  create_base_policy   = each.value.create_base_policy
  description          = each.value.description
  tags                 = each.value.tags
  tags_all             = each.value.tags_all
}
