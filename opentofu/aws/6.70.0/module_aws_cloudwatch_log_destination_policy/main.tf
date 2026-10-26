resource "aws_cloudwatch_log_destination_policy" "cloudwatch_log_destination_policies" {
  for_each = var.cloudwatch_log_destination_policies

  access_policy    = each.value.access_policy
  destination_name = each.value.destination_name
  force_update     = each.value.force_update
  region           = each.value.region
}
