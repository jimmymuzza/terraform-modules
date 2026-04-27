resource "azurerm_mssql_managed_instance_failover_group" "mssql_managed_instance_failover_groups" {
  for_each = var.mssql_managed_instance_failover_groups

  location                                  = each.value.location
  managed_instance_id                       = each.value.managed_instance_id
  name                                      = each.value.name
  partner_managed_instance_id               = each.value.partner_managed_instance_id
  readonly_endpoint_failover_policy_enabled = each.value.readonly_endpoint_failover_policy_enabled
  secondary_type                            = each.value.secondary_type

  dynamic "read_write_endpoint_failover_policy" {
    for_each = each.value.read_write_endpoint_failover_policy != null ? each.value.read_write_endpoint_failover_policy : []
    content {
      mode          = read_write_endpoint_failover_policy.value.mode
      grace_minutes = read_write_endpoint_failover_policy.value.grace_minutes
    }
  }
}
