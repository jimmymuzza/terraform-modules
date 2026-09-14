resource "aws_ssm_parameter" "ssm_parameters" {
  for_each = var.ssm_parameters

  name             = each.value.name
  type             = each.value.type
  allowed_pattern  = each.value.allowed_pattern
  arn              = each.value.arn
  data_type        = each.value.data_type
  description      = each.value.description
  insecure_value   = each.value.insecure_value
  key_id           = each.value.key_id
  overwrite        = each.value.overwrite
  region           = each.value.region
  tags             = each.value.tags
  tags_all         = each.value.tags_all
  tier             = each.value.tier
  value            = each.value.value
  value_wo         = each.value.value_wo
  value_wo_version = each.value.value_wo_version
}
