resource "aws_appstream_user" "appstream_users" {
  for_each = var.appstream_users

  authentication_type     = each.value.authentication_type
  user_name               = each.value.user_name
  enabled                 = each.value.enabled
  first_name              = each.value.first_name
  last_name               = each.value.last_name
  region                  = each.value.region
  send_email_notification = each.value.send_email_notification
}
