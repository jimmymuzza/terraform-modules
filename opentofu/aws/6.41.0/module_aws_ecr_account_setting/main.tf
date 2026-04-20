resource "aws_ecr_account_setting" "ecr_account_settings" {
  for_each = var.ecr_account_settings

  name   = each.value.name
  value  = each.value.value
  region = each.value.region
}
