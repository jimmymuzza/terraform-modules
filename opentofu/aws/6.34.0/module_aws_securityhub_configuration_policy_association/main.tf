resource "aws_securityhub_configuration_policy_association" "securityhub_configuration_policy_associations" {
  for_each = var.securityhub_configuration_policy_associations

  policy_id = each.value.policy_id
  target_id = each.value.target_id
  region    = each.value.region
}
