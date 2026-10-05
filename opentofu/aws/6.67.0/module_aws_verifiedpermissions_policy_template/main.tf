resource "aws_verifiedpermissions_policy_template" "verifiedpermissions_policy_templates" {
  for_each = var.verifiedpermissions_policy_templates

  policy_store_id = each.value.policy_store_id
  statement       = each.value.statement
  description     = each.value.description
  region          = each.value.region
}
