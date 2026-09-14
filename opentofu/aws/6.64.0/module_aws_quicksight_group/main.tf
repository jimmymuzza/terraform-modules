resource "aws_quicksight_group" "quicksight_groups" {
  for_each = var.quicksight_groups

  group_name     = each.value.group_name
  aws_account_id = each.value.aws_account_id
  description    = each.value.description
  namespace      = each.value.namespace
  region         = each.value.region
}
