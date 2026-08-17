resource "aws_lambda_capacity_provider" "lambda_capacity_providers" {
  for_each = var.lambda_capacity_providers

  name                             = each.value.name
  capacity_provider_scaling_config = each.value.capacity_provider_scaling_config
  instance_requirements            = each.value.instance_requirements
  kms_key_arn                      = each.value.kms_key_arn
  region                           = each.value.region
  tags                             = each.value.tags

  dynamic "permissions_config" {
    for_each = each.value.permissions_config != null ? each.value.permissions_config : []
    content {
      capacity_provider_operator_role_arn = permissions_config.value.capacity_provider_operator_role_arn
    }
  }

  dynamic "vpc_config" {
    for_each = each.value.vpc_config != null ? each.value.vpc_config : []
    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnet_ids         = vpc_config.value.subnet_ids
    }
  }
}
