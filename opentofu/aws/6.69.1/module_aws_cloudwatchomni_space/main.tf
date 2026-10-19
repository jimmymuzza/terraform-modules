resource "aws_cloudwatchomni_space" "cloudwatchomni_spaces" {
  for_each = var.cloudwatchomni_spaces

  data_access_role_arn           = each.value.data_access_role_arn
  domain_id                      = each.value.domain_id
  name                           = each.value.name
  agent_core_evaluation_role_arn = each.value.agent_core_evaluation_role_arn
  region                         = each.value.region

  dynamic "encryption_configuration" {
    for_each = each.value.encryption_configuration != null ? each.value.encryption_configuration : []
    content {
      encryption_strategy = encryption_configuration.value.encryption_strategy
      kms_key_arn         = encryption_configuration.value.kms_key_arn
    }
  }
}
