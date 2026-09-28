resource "aws_iot_topic_rule_destination" "iot_topic_rule_destinations" {
  for_each = var.iot_topic_rule_destinations

  enabled = each.value.enabled
  region  = each.value.region

  dynamic "vpc_configuration" {
    for_each = each.value.vpc_configuration != null ? each.value.vpc_configuration : []
    content {
      role_arn        = vpc_configuration.value.role_arn
      subnet_ids      = vpc_configuration.value.subnet_ids
      vpc_id          = vpc_configuration.value.vpc_id
      security_groups = vpc_configuration.value.security_groups
    }
  }
}
