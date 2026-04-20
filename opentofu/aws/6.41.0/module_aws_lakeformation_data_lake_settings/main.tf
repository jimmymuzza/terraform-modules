resource "aws_lakeformation_data_lake_settings" "lakeformation_data_lake_settings" {
  for_each = var.lakeformation_data_lake_settings

  admins                                = each.value.admins
  allow_external_data_filtering         = each.value.allow_external_data_filtering
  allow_full_table_external_data_access = each.value.allow_full_table_external_data_access
  authorized_session_tag_value_list     = each.value.authorized_session_tag_value_list
  catalog_id                            = each.value.catalog_id
  external_data_filtering_allow_list    = each.value.external_data_filtering_allow_list
  parameters                            = each.value.parameters
  read_only_admins                      = each.value.read_only_admins
  region                                = each.value.region
  trusted_resource_owners               = each.value.trusted_resource_owners

  dynamic "create_database_default_permissions" {
    for_each = each.value.create_database_default_permissions != null ? each.value.create_database_default_permissions : []
    content {
      permissions = create_database_default_permissions.value.permissions
      principal   = create_database_default_permissions.value.principal
    }
  }

  dynamic "create_table_default_permissions" {
    for_each = each.value.create_table_default_permissions != null ? each.value.create_table_default_permissions : []
    content {
      permissions = create_table_default_permissions.value.permissions
      principal   = create_table_default_permissions.value.principal
    }
  }
}
