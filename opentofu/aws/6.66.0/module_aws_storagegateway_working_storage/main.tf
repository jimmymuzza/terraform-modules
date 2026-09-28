resource "aws_storagegateway_working_storage" "storagegateway_working_storages" {
  for_each = var.storagegateway_working_storages

  disk_id     = each.value.disk_id
  gateway_arn = each.value.gateway_arn
  region      = each.value.region
}
