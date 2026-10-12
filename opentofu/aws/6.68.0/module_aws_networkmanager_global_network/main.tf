resource "aws_networkmanager_global_network" "networkmanager_global_networks" {
  for_each = var.networkmanager_global_networks

  description = each.value.description
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
