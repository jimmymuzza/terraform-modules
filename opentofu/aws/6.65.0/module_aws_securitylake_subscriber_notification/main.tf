resource "aws_securitylake_subscriber_notification" "securitylake_subscriber_notifications" {
  for_each = var.securitylake_subscriber_notifications

  subscriber_id = each.value.subscriber_id
  region        = each.value.region

  dynamic "configuration" {
    for_each = each.value.configuration != null ? each.value.configuration : []
    content {

      dynamic "https_notification_configuration" {
        for_each = configuration.value.https_notification_configuration != null ? configuration.value.https_notification_configuration : []
        content {
          endpoint                    = https_notification_configuration.value.endpoint
          target_role_arn             = https_notification_configuration.value.target_role_arn
          authorization_api_key_name  = https_notification_configuration.value.authorization_api_key_name
          authorization_api_key_value = https_notification_configuration.value.authorization_api_key_value
          http_method                 = https_notification_configuration.value.http_method
        }
      }

      dynamic "sqs_notification_configuration" {
        for_each = configuration.value.sqs_notification_configuration != null ? configuration.value.sqs_notification_configuration : []
        content {
        }
      }
    }
  }
}
