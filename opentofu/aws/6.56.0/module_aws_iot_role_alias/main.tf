resource "aws_iot_role_alias" "iot_role_alias" {
  for_each = var.iot_role_alias

  alias               = each.value.alias
  role_arn            = each.value.role_arn
  credential_duration = each.value.credential_duration
  region              = each.value.region
  tags                = each.value.tags
  tags_all            = each.value.tags_all
}
