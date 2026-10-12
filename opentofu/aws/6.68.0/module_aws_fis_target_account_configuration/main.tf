resource "aws_fis_target_account_configuration" "fis_target_account_configurations" {
  for_each = var.fis_target_account_configurations

  account_id             = each.value.account_id
  experiment_template_id = each.value.experiment_template_id
  description            = each.value.description
  region                 = each.value.region
  role_arn               = each.value.role_arn
}
