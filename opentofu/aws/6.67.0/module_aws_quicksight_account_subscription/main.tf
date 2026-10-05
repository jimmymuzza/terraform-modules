resource "aws_quicksight_account_subscription" "quicksight_account_subscriptions" {
  for_each = var.quicksight_account_subscriptions

  account_name                     = each.value.account_name
  authentication_method            = each.value.authentication_method
  edition                          = each.value.edition
  notification_email               = each.value.notification_email
  active_directory_name            = each.value.active_directory_name
  admin_group                      = each.value.admin_group
  admin_pro_group                  = each.value.admin_pro_group
  author_group                     = each.value.author_group
  author_pro_group                 = each.value.author_pro_group
  aws_account_id                   = each.value.aws_account_id
  contact_number                   = each.value.contact_number
  directory_id                     = each.value.directory_id
  email_address                    = each.value.email_address
  first_name                       = each.value.first_name
  iam_identity_center_instance_arn = each.value.iam_identity_center_instance_arn
  last_name                        = each.value.last_name
  reader_group                     = each.value.reader_group
  reader_pro_group                 = each.value.reader_pro_group
  realm                            = each.value.realm
  region                           = each.value.region
}
