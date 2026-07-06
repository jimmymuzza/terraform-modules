resource "aws_verifiedpermissions_schema" "verifiedpermissions_schemas" {
  for_each = var.verifiedpermissions_schemas

  policy_store_id = each.value.policy_store_id
  region          = each.value.region

  dynamic "definition" {
    for_each = each.value.definition != null ? each.value.definition : []
    content {
      value = definition.value.value
    }
  }
}
