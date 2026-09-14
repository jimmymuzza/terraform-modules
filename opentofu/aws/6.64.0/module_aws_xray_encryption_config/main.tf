resource "aws_xray_encryption_config" "xray_encryption_configs" {
  for_each = var.xray_encryption_configs

  type   = each.value.type
  key_id = each.value.key_id
  region = each.value.region
}
