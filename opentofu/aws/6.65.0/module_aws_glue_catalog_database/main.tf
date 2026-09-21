resource "aws_glue_catalog_database" "glue_catalog_databases" {
  for_each = var.glue_catalog_databases

  name         = each.value.name
  catalog_id   = each.value.catalog_id
  description  = each.value.description
  location_uri = each.value.location_uri
  parameters   = each.value.parameters
  region       = each.value.region
  tags         = each.value.tags
  tags_all     = each.value.tags_all

  dynamic "create_table_default_permission" {
    for_each = each.value.create_table_default_permission != null ? each.value.create_table_default_permission : []
    content {
      permissions = create_table_default_permission.value.permissions

      dynamic "principal" {
        for_each = create_table_default_permission.value.principal != null ? create_table_default_permission.value.principal : []
        content {
          data_lake_principal_identifier = principal.value.data_lake_principal_identifier
        }
      }
    }
  }

  dynamic "federated_database" {
    for_each = each.value.federated_database != null ? each.value.federated_database : []
    content {
      connection_name = federated_database.value.connection_name
      identifier      = federated_database.value.identifier
    }
  }

  dynamic "target_database" {
    for_each = each.value.target_database != null ? each.value.target_database : []
    content {
      catalog_id    = target_database.value.catalog_id
      database_name = target_database.value.database_name
      region        = target_database.value.region
    }
  }
}
