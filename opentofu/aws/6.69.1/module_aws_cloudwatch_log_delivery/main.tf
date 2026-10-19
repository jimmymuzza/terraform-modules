resource "aws_cloudwatch_log_delivery" "cloudwatch_log_deliveries" {
  for_each = var.cloudwatch_log_deliveries

  delivery_destination_arn  = each.value.delivery_destination_arn
  delivery_source_name      = each.value.delivery_source_name
  field_delimiter           = each.value.field_delimiter
  record_fields             = each.value.record_fields
  region                    = each.value.region
  s3_delivery_configuration = each.value.s3_delivery_configuration
  tags                      = each.value.tags
}
