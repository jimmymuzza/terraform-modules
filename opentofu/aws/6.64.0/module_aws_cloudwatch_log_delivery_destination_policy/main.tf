resource "aws_cloudwatch_log_delivery_destination_policy" "cloudwatch_log_delivery_destination_policies" {
  for_each = var.cloudwatch_log_delivery_destination_policies

  delivery_destination_name   = each.value.delivery_destination_name
  delivery_destination_policy = each.value.delivery_destination_policy
  region                      = each.value.region
}
