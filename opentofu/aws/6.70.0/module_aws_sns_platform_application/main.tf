resource "aws_sns_platform_application" "sns_platform_applications" {
  for_each = var.sns_platform_applications

  name                             = each.value.name
  platform                         = each.value.platform
  platform_credential              = each.value.platform_credential
  apple_platform_bundle_id         = each.value.apple_platform_bundle_id
  apple_platform_team_id           = each.value.apple_platform_team_id
  event_delivery_failure_topic_arn = each.value.event_delivery_failure_topic_arn
  event_endpoint_created_topic_arn = each.value.event_endpoint_created_topic_arn
  event_endpoint_deleted_topic_arn = each.value.event_endpoint_deleted_topic_arn
  event_endpoint_updated_topic_arn = each.value.event_endpoint_updated_topic_arn
  failure_feedback_role_arn        = each.value.failure_feedback_role_arn
  platform_principal               = each.value.platform_principal
  region                           = each.value.region
  success_feedback_role_arn        = each.value.success_feedback_role_arn
  success_feedback_sample_rate     = each.value.success_feedback_sample_rate
}
