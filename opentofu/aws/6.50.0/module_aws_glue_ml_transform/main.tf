resource "aws_glue_ml_transform" "glue_ml_transforms" {
  for_each = var.glue_ml_transforms

  name              = each.value.name
  role_arn          = each.value.role_arn
  description       = each.value.description
  glue_version      = each.value.glue_version
  max_capacity      = each.value.max_capacity
  max_retries       = each.value.max_retries
  number_of_workers = each.value.number_of_workers
  region            = each.value.region
  tags              = each.value.tags
  tags_all          = each.value.tags_all
  timeout           = each.value.timeout
  worker_type       = each.value.worker_type

  dynamic "input_record_tables" {
    for_each = each.value.input_record_tables != null ? each.value.input_record_tables : []
    content {
      database_name   = input_record_tables.value.database_name
      table_name      = input_record_tables.value.table_name
      catalog_id      = input_record_tables.value.catalog_id
      connection_name = input_record_tables.value.connection_name
    }
  }

  dynamic "parameters" {
    for_each = each.value.parameters != null ? each.value.parameters : []
    content {
      transform_type = parameters.value.transform_type

      dynamic "find_matches_parameters" {
        for_each = parameters.value.find_matches_parameters != null ? parameters.value.find_matches_parameters : []
        content {
          accuracy_cost_trade_off    = find_matches_parameters.value.accuracy_cost_trade_off
          enforce_provided_labels    = find_matches_parameters.value.enforce_provided_labels
          precision_recall_trade_off = find_matches_parameters.value.precision_recall_trade_off
          primary_key_column_name    = find_matches_parameters.value.primary_key_column_name
        }
      }
    }
  }
}
