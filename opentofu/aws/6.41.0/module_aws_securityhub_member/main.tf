resource "aws_securityhub_member" "securityhub_members" {
  for_each = var.securityhub_members

  account_id = each.value.account_id
  email      = each.value.email
  invite     = each.value.invite
  region     = each.value.region
}
