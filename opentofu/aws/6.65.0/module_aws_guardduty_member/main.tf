resource "aws_guardduty_member" "guardduty_members" {
  for_each = var.guardduty_members

  account_id                 = each.value.account_id
  detector_id                = each.value.detector_id
  email                      = each.value.email
  disable_email_notification = each.value.disable_email_notification
  invitation_message         = each.value.invitation_message
  invite                     = each.value.invite
  region                     = each.value.region
}
