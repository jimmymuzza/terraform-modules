resource "aws_network_interface_permission" "network_interface_permissions" {
  for_each = var.network_interface_permissions

  aws_account_id       = each.value.aws_account_id
  network_interface_id = each.value.network_interface_id
  permission           = each.value.permission
  region               = each.value.region
}
