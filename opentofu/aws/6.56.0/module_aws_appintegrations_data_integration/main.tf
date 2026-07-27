resource "aws_appintegrations_data_integration" "appintegrations_data_integrations" {
  for_each = var.appintegrations_data_integrations

  kms_key     = each.value.kms_key
  name        = each.value.name
  source_uri  = each.value.source_uri
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "schedule_config" {
    for_each = each.value.schedule_config != null ? each.value.schedule_config : []
    content {
      first_execution_from = schedule_config.value.first_execution_from
      object               = schedule_config.value.object
      schedule_expression  = schedule_config.value.schedule_expression
    }
  }
}
