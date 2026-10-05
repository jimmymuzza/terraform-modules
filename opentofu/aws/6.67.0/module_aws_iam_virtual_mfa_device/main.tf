resource "aws_iam_virtual_mfa_device" "iam_virtual_mfa_devices" {
  for_each = var.iam_virtual_mfa_devices

  virtual_mfa_device_name = each.value.virtual_mfa_device_name
  path                    = each.value.path
  tags                    = each.value.tags
  tags_all                = each.value.tags_all
}
