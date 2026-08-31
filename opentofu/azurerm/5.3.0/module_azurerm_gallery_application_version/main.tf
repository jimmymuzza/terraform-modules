resource "azurerm_gallery_application_version" "gallery_application_versions" {
  for_each = var.gallery_application_versions

  gallery_application_id = each.value.gallery_application_id
  location               = each.value.location
  name                   = each.value.name
  config_file            = each.value.config_file
  enable_health_check    = each.value.enable_health_check
  end_of_life_date       = each.value.end_of_life_date
  exclude_from_latest    = each.value.exclude_from_latest
  package_file           = each.value.package_file
  tags                   = each.value.tags

  dynamic "manage_action" {
    for_each = each.value.manage_action != null ? each.value.manage_action : []
    content {
      install = manage_action.value.install
      remove  = manage_action.value.remove
      update  = manage_action.value.update
    }
  }

  dynamic "source" {
    for_each = each.value.source != null ? each.value.source : []
    content {
      media_link                 = source.value.media_link
      default_configuration_link = source.value.default_configuration_link
    }
  }

  dynamic "target_region" {
    for_each = each.value.target_region != null ? each.value.target_region : []
    content {
      name                   = target_region.value.name
      regional_replica_count = target_region.value.regional_replica_count
      exclude_from_latest    = target_region.value.exclude_from_latest
      storage_account_type   = target_region.value.storage_account_type
    }
  }
}
