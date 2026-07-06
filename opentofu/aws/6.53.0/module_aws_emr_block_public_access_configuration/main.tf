resource "aws_emr_block_public_access_configuration" "emr_block_public_access_configurations" {
  for_each = var.emr_block_public_access_configurations

  block_public_security_group_rules = each.value.block_public_security_group_rules
  region                            = each.value.region

  dynamic "permitted_public_security_group_rule_range" {
    for_each = each.value.permitted_public_security_group_rule_range != null ? each.value.permitted_public_security_group_rule_range : []
    content {
      max_range = permitted_public_security_group_rule_range.value.max_range
      min_range = permitted_public_security_group_rule_range.value.min_range
    }
  }
}
