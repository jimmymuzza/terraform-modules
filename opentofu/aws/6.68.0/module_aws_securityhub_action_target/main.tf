resource "aws_securityhub_action_target" "securityhub_action_targets" {
  for_each = var.securityhub_action_targets

  description = each.value.description
  identifier  = each.value.identifier
  name        = each.value.name
  region      = each.value.region
}
