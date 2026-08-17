resource "aws_storagegateway_cached_iscsi_volume" "storagegateway_cached_iscsi_volumes" {
  for_each = var.storagegateway_cached_iscsi_volumes

  gateway_arn          = each.value.gateway_arn
  network_interface_id = each.value.network_interface_id
  target_name          = each.value.target_name
  volume_size_in_bytes = each.value.volume_size_in_bytes
  kms_encrypted        = each.value.kms_encrypted
  kms_key              = each.value.kms_key
  region               = each.value.region
  snapshot_id          = each.value.snapshot_id
  source_volume_arn    = each.value.source_volume_arn
  tags                 = each.value.tags
  tags_all             = each.value.tags_all
}
