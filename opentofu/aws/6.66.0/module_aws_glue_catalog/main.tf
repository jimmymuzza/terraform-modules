resource "aws_glue_catalog" "glue_catalogs" {
  for_each = var.glue_catalogs

  name                                              = each.value.name
  allow_full_table_external_data_access             = each.value.allow_full_table_external_data_access
  description                                       = each.value.description
  overwrite_child_resource_permissions_with_default = each.value.overwrite_child_resource_permissions_with_default
  parameters                                        = each.value.parameters
  region                                            = each.value.region
  tags                                              = each.value.tags

  dynamic "catalog_properties" {
    for_each = each.value.catalog_properties != null ? each.value.catalog_properties : []
    content {
      custom_properties = catalog_properties.value.custom_properties

      dynamic "data_lake_access_properties" {
        for_each = catalog_properties.value.data_lake_access_properties != null ? catalog_properties.value.data_lake_access_properties : []
        content {
          catalog_type       = data_lake_access_properties.value.catalog_type
          data_lake_access   = data_lake_access_properties.value.data_lake_access
          data_transfer_role = data_lake_access_properties.value.data_transfer_role
          kms_key            = data_lake_access_properties.value.kms_key
        }
      }

      dynamic "iceberg_optimization_properties" {
        for_each = catalog_properties.value.iceberg_optimization_properties != null ? catalog_properties.value.iceberg_optimization_properties : []
        content {
          compaction           = iceberg_optimization_properties.value.compaction
          orphan_file_deletion = iceberg_optimization_properties.value.orphan_file_deletion
          retention            = iceberg_optimization_properties.value.retention
          role_arn             = iceberg_optimization_properties.value.role_arn
        }
      }
    }
  }

  dynamic "create_database_default_permissions" {
    for_each = each.value.create_database_default_permissions != null ? each.value.create_database_default_permissions : []
    content {
      permissions = create_database_default_permissions.value.permissions

      dynamic "principal" {
        for_each = create_database_default_permissions.value.principal != null ? create_database_default_permissions.value.principal : []
        content {
          data_lake_principal_identifier = principal.value.data_lake_principal_identifier
        }
      }
    }
  }

  dynamic "create_table_default_permissions" {
    for_each = each.value.create_table_default_permissions != null ? each.value.create_table_default_permissions : []
    content {
      permissions = create_table_default_permissions.value.permissions

      dynamic "principal" {
        for_each = create_table_default_permissions.value.principal != null ? create_table_default_permissions.value.principal : []
        content {
          data_lake_principal_identifier = principal.value.data_lake_principal_identifier
        }
      }
    }
  }

  dynamic "federated_catalog" {
    for_each = each.value.federated_catalog != null ? each.value.federated_catalog : []
    content {
      connection_name = federated_catalog.value.connection_name
      connection_type = federated_catalog.value.connection_type
      identifier      = federated_catalog.value.identifier
    }
  }

  dynamic "target_redshift_catalog" {
    for_each = each.value.target_redshift_catalog != null ? each.value.target_redshift_catalog : []
    content {
      catalog_arn = target_redshift_catalog.value.catalog_arn
    }
  }
}
