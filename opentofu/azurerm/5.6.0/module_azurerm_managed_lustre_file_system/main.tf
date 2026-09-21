resource "azurerm_managed_lustre_file_system" "managed_lustre_file_systems" {
  for_each = var.managed_lustre_file_systems

  location               = each.value.location
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  sku_name               = each.value.sku_name
  storage_capacity_in_tb = each.value.storage_capacity_in_tb
  subnet_id              = each.value.subnet_id
  zones                  = each.value.zones
  tags                   = each.value.tags

  dynamic "encryption_key" {
    for_each = each.value.encryption_key != null ? each.value.encryption_key : []
    content {
      key_url         = encryption_key.value.key_url
      source_vault_id = encryption_key.value.source_vault_id
    }
  }

  dynamic "hsm_setting" {
    for_each = each.value.hsm_setting != null ? each.value.hsm_setting : []
    content {
      container_id         = hsm_setting.value.container_id
      logging_container_id = hsm_setting.value.logging_container_id
      import_prefix        = hsm_setting.value.import_prefix
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "maintenance_window" {
    for_each = each.value.maintenance_window != null ? each.value.maintenance_window : []
    content {
      day_of_week        = maintenance_window.value.day_of_week
      time_of_day_in_utc = maintenance_window.value.time_of_day_in_utc
    }
  }

  dynamic "root_squash" {
    for_each = each.value.root_squash != null ? each.value.root_squash : []
    content {
      mode           = root_squash.value.mode
      no_squash_nids = root_squash.value.no_squash_nids
      squash_gid     = root_squash.value.squash_gid
      squash_uid     = root_squash.value.squash_uid
    }
  }
}
