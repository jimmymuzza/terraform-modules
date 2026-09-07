resource "azurerm_postgresql_flexible_server" "postgresql_flexible_servers" {
  for_each = var.postgresql_flexible_servers

  location                          = each.value.location
  name                              = each.value.name
  resource_group_name               = each.value.resource_group_name
  administrator_login               = each.value.administrator_login
  administrator_password            = each.value.administrator_password
  administrator_password_wo         = each.value.administrator_password_wo
  administrator_password_wo_version = each.value.administrator_password_wo_version
  auto_grow_enabled                 = each.value.auto_grow_enabled
  backup_retention_days             = each.value.backup_retention_days
  create_mode                       = each.value.create_mode
  delegated_subnet_id               = each.value.delegated_subnet_id
  geo_redundant_backup_enabled      = each.value.geo_redundant_backup_enabled
  point_in_time_restore_time_in_utc = each.value.point_in_time_restore_time_in_utc
  private_dns_zone_id               = each.value.private_dns_zone_id
  public_network_access_enabled     = each.value.public_network_access_enabled
  replication_role                  = each.value.replication_role
  sku_name                          = each.value.sku_name
  source_server_id                  = each.value.source_server_id
  storage_iops                      = each.value.storage_iops
  storage_mb                        = each.value.storage_mb
  storage_throughput                = each.value.storage_throughput
  storage_tier                      = each.value.storage_tier
  storage_type                      = each.value.storage_type
  tags                              = each.value.tags
  version                           = each.value.version
  zone                              = each.value.zone

  dynamic "authentication" {
    for_each = each.value.authentication != null ? each.value.authentication : []
    content {
      active_directory_auth_enabled = authentication.value.active_directory_auth_enabled
      password_auth_enabled         = authentication.value.password_auth_enabled
      tenant_id                     = authentication.value.tenant_id
    }
  }

  dynamic "cluster" {
    for_each = each.value.cluster != null ? each.value.cluster : []
    content {
      size                  = cluster.value.size
      default_database_name = cluster.value.default_database_name
    }
  }

  dynamic "customer_managed_key" {
    for_each = each.value.customer_managed_key != null ? each.value.customer_managed_key : []
    content {
      key_vault_key_id                     = customer_managed_key.value.key_vault_key_id
      geo_backup_key_vault_key_id          = customer_managed_key.value.geo_backup_key_vault_key_id
      geo_backup_user_assigned_identity_id = customer_managed_key.value.geo_backup_user_assigned_identity_id
      primary_user_assigned_identity_id    = customer_managed_key.value.primary_user_assigned_identity_id
    }
  }

  dynamic "high_availability" {
    for_each = each.value.high_availability != null ? each.value.high_availability : []
    content {
      mode                      = high_availability.value.mode
      standby_availability_zone = high_availability.value.standby_availability_zone
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "maintenance_window" {
    for_each = each.value.maintenance_window != null ? each.value.maintenance_window : []
    content {
      day_of_week  = maintenance_window.value.day_of_week
      start_hour   = maintenance_window.value.start_hour
      start_minute = maintenance_window.value.start_minute
    }
  }
}
