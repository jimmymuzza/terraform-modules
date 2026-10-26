resource "azurerm_mssql_failover_group" "mssql_failover_groups" {
  for_each = var.mssql_failover_groups

  name                                      = each.value.name
  server_id                                 = each.value.server_id
  databases                                 = each.value.databases
  readonly_endpoint_failover_policy_enabled = each.value.readonly_endpoint_failover_policy_enabled
  tags                                      = each.value.tags

  dynamic "partner_server" {
    for_each = each.value.partner_server != null ? each.value.partner_server : []
    content {
    }
  }

  dynamic "read_write_endpoint_failover_policy" {
    for_each = each.value.read_write_endpoint_failover_policy != null ? each.value.read_write_endpoint_failover_policy : []
    content {
      mode          = read_write_endpoint_failover_policy.value.mode
      grace_minutes = read_write_endpoint_failover_policy.value.grace_minutes
    }
  }
}
