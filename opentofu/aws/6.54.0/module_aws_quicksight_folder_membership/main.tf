resource "aws_quicksight_folder_membership" "quicksight_folder_memberships" {
  for_each = var.quicksight_folder_memberships

  folder_id      = each.value.folder_id
  member_id      = each.value.member_id
  member_type    = each.value.member_type
  aws_account_id = each.value.aws_account_id
  region         = each.value.region
}
