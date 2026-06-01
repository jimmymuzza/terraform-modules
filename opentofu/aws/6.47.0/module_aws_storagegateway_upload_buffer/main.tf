resource "aws_storagegateway_upload_buffer" "storagegateway_upload_buffers" {
  for_each = var.storagegateway_upload_buffers

  gateway_arn = each.value.gateway_arn
  disk_id     = each.value.disk_id
  disk_path   = each.value.disk_path
  region      = each.value.region
}
