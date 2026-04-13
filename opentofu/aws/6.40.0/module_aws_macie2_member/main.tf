resource "aws_macie2_member" "macie2_members" {
  for_each = var.macie2_members

  account_id                            = each.value.account_id
  email                                 = each.value.email
  invitation_disable_email_notification = each.value.invitation_disable_email_notification
  invitation_message                    = each.value.invitation_message
  invite                                = each.value.invite
  region                                = each.value.region
  status                                = each.value.status
  tags                                  = each.value.tags
  tags_all                              = each.value.tags_all
}
