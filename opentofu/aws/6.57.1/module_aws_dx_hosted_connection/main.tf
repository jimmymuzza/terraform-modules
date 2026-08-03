resource "aws_dx_hosted_connection" "dx_hosted_connections" {
  for_each = var.dx_hosted_connections

  bandwidth        = each.value.bandwidth
  connection_id    = each.value.connection_id
  name             = each.value.name
  owner_account_id = each.value.owner_account_id
  vlan             = each.value.vlan
}
