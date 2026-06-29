resource "azurerm_mssql_virtual_machine_availability_group_listener" "mssql_virtual_machine_availability_group_listeners" {
  for_each = var.mssql_virtual_machine_availability_group_listeners

  name                         = each.value.name
  sql_virtual_machine_group_id = each.value.sql_virtual_machine_group_id
  availability_group_name      = each.value.availability_group_name
  port                         = each.value.port

  dynamic "load_balancer_configuration" {
    for_each = each.value.load_balancer_configuration != null ? each.value.load_balancer_configuration : []
    content {
      load_balancer_id        = load_balancer_configuration.value.load_balancer_id
      private_ip_address      = load_balancer_configuration.value.private_ip_address
      probe_port              = load_balancer_configuration.value.probe_port
      sql_virtual_machine_ids = load_balancer_configuration.value.sql_virtual_machine_ids
      subnet_id               = load_balancer_configuration.value.subnet_id
    }
  }

  dynamic "multi_subnet_ip_configuration" {
    for_each = each.value.multi_subnet_ip_configuration != null ? each.value.multi_subnet_ip_configuration : []
    content {
      private_ip_address     = multi_subnet_ip_configuration.value.private_ip_address
      sql_virtual_machine_id = multi_subnet_ip_configuration.value.sql_virtual_machine_id
      subnet_id              = multi_subnet_ip_configuration.value.subnet_id
    }
  }

  dynamic "replica" {
    for_each = each.value.replica != null ? each.value.replica : []
    content {
      commit                 = replica.value.commit
      failover_mode          = replica.value.failover_mode
      readable_secondary     = replica.value.readable_secondary
      role                   = replica.value.role
      sql_virtual_machine_id = replica.value.sql_virtual_machine_id
    }
  }
}
