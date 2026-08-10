resource "aws_quicksight_account_settings" "quicksight_account_settings" {
  for_each = var.quicksight_account_settings

  aws_account_id                 = each.value.aws_account_id
  default_namespace              = each.value.default_namespace
  region                         = each.value.region
  termination_protection_enabled = each.value.termination_protection_enabled
}
