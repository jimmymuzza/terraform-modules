resource "aws_storagegateway_stored_iscsi_volume" "storagegateway_stored_iscsi_volumes" {
  for_each = var.storagegateway_stored_iscsi_volumes

  disk_id                = each.value.disk_id
  gateway_arn            = each.value.gateway_arn
  network_interface_id   = each.value.network_interface_id
  preserve_existing_data = each.value.preserve_existing_data
  target_name            = each.value.target_name
  kms_encrypted          = each.value.kms_encrypted
  kms_key                = each.value.kms_key
  region                 = each.value.region
  snapshot_id            = each.value.snapshot_id
  tags                   = each.value.tags
  tags_all               = each.value.tags_all
}
