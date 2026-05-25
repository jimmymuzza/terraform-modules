resource "aws_lakeformation_opt_in" "lakeformation_opt_ins" {
  for_each = var.lakeformation_opt_ins

  region = each.value.region

  dynamic "condition" {
    for_each = each.value.condition != null ? each.value.condition : []
    content {
    }
  }

  dynamic "principal" {
    for_each = each.value.principal != null ? each.value.principal : []
    content {
      data_lake_principal_identifier = principal.value.data_lake_principal_identifier
    }
  }

  dynamic "resource_data" {
    for_each = each.value.resource_data != null ? each.value.resource_data : []
    content {

      dynamic "catalog" {
        for_each = resource_data.value.catalog != null ? resource_data.value.catalog : []
        content {
        }
      }

      dynamic "data_cells_filter" {
        for_each = resource_data.value.data_cells_filter != null ? resource_data.value.data_cells_filter : []
        content {
          database_name    = data_cells_filter.value.database_name
          name             = data_cells_filter.value.name
          table_catalog_id = data_cells_filter.value.table_catalog_id
          table_name       = data_cells_filter.value.table_name
        }
      }

      dynamic "data_location" {
        for_each = resource_data.value.data_location != null ? resource_data.value.data_location : []
        content {
          resource_arn = data_location.value.resource_arn
          catalog_id   = data_location.value.catalog_id
        }
      }

      dynamic "database" {
        for_each = resource_data.value.database != null ? resource_data.value.database : []
        content {
          name       = database.value.name
          catalog_id = database.value.catalog_id
        }
      }

      dynamic "lf_tag" {
        for_each = resource_data.value.lf_tag != null ? resource_data.value.lf_tag : []
        content {
          key        = lf_tag.value.key
          values     = lf_tag.value.values
          catalog_id = lf_tag.value.catalog_id
        }
      }

      dynamic "lf_tag_expression" {
        for_each = resource_data.value.lf_tag_expression != null ? resource_data.value.lf_tag_expression : []
        content {
          name       = lf_tag_expression.value.name
          catalog_id = lf_tag_expression.value.catalog_id
        }
      }

      dynamic "lf_tag_policy" {
        for_each = resource_data.value.lf_tag_policy != null ? resource_data.value.lf_tag_policy : []
        content {
          resource_type   = lf_tag_policy.value.resource_type
          catalog_id      = lf_tag_policy.value.catalog_id
          expression      = lf_tag_policy.value.expression
          expression_name = lf_tag_policy.value.expression_name
        }
      }

      dynamic "table" {
        for_each = resource_data.value.table != null ? resource_data.value.table : []
        content {
          database_name = table.value.database_name
          catalog_id    = table.value.catalog_id
          name          = table.value.name
          wildcard      = table.value.wildcard
        }
      }

      dynamic "table_with_columns" {
        for_each = resource_data.value.table_with_columns != null ? resource_data.value.table_with_columns : []
        content {
          database_name = table_with_columns.value.database_name
          name          = table_with_columns.value.name
          catalog_id    = table_with_columns.value.catalog_id
          column_names  = table_with_columns.value.column_names

          dynamic "column_wildcard" {
            for_each = table_with_columns.value.column_wildcard != null ? table_with_columns.value.column_wildcard : []
            content {
              excluded_column_names = column_wildcard.value.excluded_column_names
            }
          }
        }
      }
    }
  }
}
