resource "aws_quicksight_template_alias" "quicksight_template_alias" {
  for_each = var.quicksight_template_alias

  alias_name              = each.value.alias_name
  template_id             = each.value.template_id
  template_version_number = each.value.template_version_number
  aws_account_id          = each.value.aws_account_id
  region                  = each.value.region
}
