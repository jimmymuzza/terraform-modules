resource "aws_storagegateway_cache" "storagegateway_caches" {
  for_each = var.storagegateway_caches

  disk_id     = each.value.disk_id
  gateway_arn = each.value.gateway_arn
  region      = each.value.region
}
