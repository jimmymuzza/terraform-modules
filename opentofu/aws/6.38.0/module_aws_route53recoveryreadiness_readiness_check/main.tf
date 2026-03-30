resource "aws_route53recoveryreadiness_readiness_check" "route53recoveryreadiness_readiness_checks" {
  for_each = var.route53recoveryreadiness_readiness_checks

  readiness_check_name = each.value.readiness_check_name
  resource_set_name    = each.value.resource_set_name
  tags                 = each.value.tags
  tags_all             = each.value.tags_all
}
