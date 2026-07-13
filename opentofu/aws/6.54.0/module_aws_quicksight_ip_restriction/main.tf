resource "aws_quicksight_ip_restriction" "quicksight_ip_restrictions" {
  for_each = var.quicksight_ip_restrictions

  enabled                              = each.value.enabled
  aws_account_id                       = each.value.aws_account_id
  ip_restriction_rule_map              = each.value.ip_restriction_rule_map
  region                               = each.value.region
  vpc_endpoint_id_restriction_rule_map = each.value.vpc_endpoint_id_restriction_rule_map
  vpc_id_restriction_rule_map          = each.value.vpc_id_restriction_rule_map
}
