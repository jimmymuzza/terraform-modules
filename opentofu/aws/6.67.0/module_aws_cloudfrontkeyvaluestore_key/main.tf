resource "aws_cloudfrontkeyvaluestore_key" "cloudfrontkeyvaluestore_keys" {
  for_each = var.cloudfrontkeyvaluestore_keys

  key                 = each.value.key
  key_value_store_arn = each.value.key_value_store_arn
  value               = each.value.value
}
