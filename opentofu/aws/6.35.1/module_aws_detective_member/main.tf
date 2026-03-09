resource "aws_detective_member" "detective_members" {
  for_each = var.detective_members

  account_id                 = each.value.account_id
  email_address              = each.value.email_address
  graph_arn                  = each.value.graph_arn
  disable_email_notification = each.value.disable_email_notification
  message                    = each.value.message
  region                     = each.value.region
}
