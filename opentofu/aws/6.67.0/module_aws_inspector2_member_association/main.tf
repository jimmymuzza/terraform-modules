resource "aws_inspector2_member_association" "inspector2_member_associations" {
  for_each = var.inspector2_member_associations

  account_id = each.value.account_id
  region     = each.value.region
}
