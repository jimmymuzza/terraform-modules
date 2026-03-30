resource "aws_directory_service_log_subscription" "directory_service_log_subscriptions" {
  for_each = var.directory_service_log_subscriptions

  directory_id   = each.value.directory_id
  log_group_name = each.value.log_group_name
  region         = each.value.region
}
