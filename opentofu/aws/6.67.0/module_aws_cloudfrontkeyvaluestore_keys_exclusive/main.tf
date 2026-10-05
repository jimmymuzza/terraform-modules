resource "aws_cloudfrontkeyvaluestore_keys_exclusive" "cloudfrontkeyvaluestore_keys_exclusives" {
  for_each = var.cloudfrontkeyvaluestore_keys_exclusives

  key_value_store_arn = each.value.key_value_store_arn
  max_batch_size      = each.value.max_batch_size

  dynamic "resource_key_value_pair" {
    for_each = each.value.resource_key_value_pair != null ? each.value.resource_key_value_pair : []
    content {
      key   = resource_key_value_pair.value.key
      value = resource_key_value_pair.value.value
    }
  }
}
