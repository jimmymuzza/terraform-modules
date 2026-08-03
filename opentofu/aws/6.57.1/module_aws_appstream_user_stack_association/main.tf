resource "aws_appstream_user_stack_association" "appstream_user_stack_associations" {
  for_each = var.appstream_user_stack_associations

  authentication_type     = each.value.authentication_type
  stack_name              = each.value.stack_name
  user_name               = each.value.user_name
  region                  = each.value.region
  send_email_notification = each.value.send_email_notification
}
