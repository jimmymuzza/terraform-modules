resource "aws_cloudwatch_log_delivery_destination" "cloudwatch_log_delivery_destinations" {
  for_each = var.cloudwatch_log_delivery_destinations

  name                      = each.value.name
  delivery_destination_type = each.value.delivery_destination_type
  output_format             = each.value.output_format
  region                    = each.value.region
  tags                      = each.value.tags

  dynamic "delivery_destination_configuration" {
    for_each = each.value.delivery_destination_configuration != null ? each.value.delivery_destination_configuration : []
    content {
      destination_resource_arn = delivery_destination_configuration.value.destination_resource_arn
    }
  }
}
