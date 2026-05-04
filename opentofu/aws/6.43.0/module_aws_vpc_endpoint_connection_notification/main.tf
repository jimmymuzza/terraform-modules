resource "aws_vpc_endpoint_connection_notification" "vpc_endpoint_connection_notifications" {
  for_each = var.vpc_endpoint_connection_notifications

  connection_events           = each.value.connection_events
  connection_notification_arn = each.value.connection_notification_arn
  region                      = each.value.region
  vpc_endpoint_id             = each.value.vpc_endpoint_id
  vpc_endpoint_service_id     = each.value.vpc_endpoint_service_id
}
