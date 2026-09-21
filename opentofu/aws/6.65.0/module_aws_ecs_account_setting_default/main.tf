resource "aws_ecs_account_setting_default" "ecs_account_setting_defaults" {
  for_each = var.ecs_account_setting_defaults

  name   = each.value.name
  value  = each.value.value
  region = each.value.region
}
