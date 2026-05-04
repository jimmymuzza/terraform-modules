resource "aws_verifiedpermissions_policy_store" "verifiedpermissions_policy_stores" {
  for_each = var.verifiedpermissions_policy_stores

  deletion_protection = each.value.deletion_protection
  description         = each.value.description
  region              = each.value.region
  tags                = each.value.tags

  dynamic "validation_settings" {
    for_each = each.value.validation_settings != null ? each.value.validation_settings : []
    content {
      mode = validation_settings.value.mode
    }
  }
}
