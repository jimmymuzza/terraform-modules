resource "aws_organizations_account" "organizations_accounts" {
  for_each = var.organizations_accounts

  email                      = each.value.email
  name                       = each.value.name
  close_on_deletion          = each.value.close_on_deletion
  create_govcloud            = each.value.create_govcloud
  iam_user_access_to_billing = each.value.iam_user_access_to_billing
  parent_id                  = each.value.parent_id
  role_name                  = each.value.role_name
  tags                       = each.value.tags
  tags_all                   = each.value.tags_all
}
