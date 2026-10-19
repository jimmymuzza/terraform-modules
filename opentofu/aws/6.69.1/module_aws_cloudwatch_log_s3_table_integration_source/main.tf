resource "aws_cloudwatch_log_s3_table_integration_source" "cloudwatch_log_s3_table_integration_sources" {
  for_each = var.cloudwatch_log_s3_table_integration_sources

  integration_arn = each.value.integration_arn
  region          = each.value.region

  dynamic "data_source" {
    for_each = each.value.data_source != null ? each.value.data_source : []
    content {
      name = data_source.value.name
      type = data_source.value.type
    }
  }
}
