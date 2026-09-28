resource "aws_storagegateway_file_system_association" "storagegateway_file_system_associations" {
  for_each = var.storagegateway_file_system_associations

  gateway_arn           = each.value.gateway_arn
  location_arn          = each.value.location_arn
  password              = each.value.password
  username              = each.value.username
  audit_destination_arn = each.value.audit_destination_arn
  region                = each.value.region
  tags                  = each.value.tags
  tags_all              = each.value.tags_all

  dynamic "cache_attributes" {
    for_each = each.value.cache_attributes != null ? each.value.cache_attributes : []
    content {
      cache_stale_timeout_in_seconds = cache_attributes.value.cache_stale_timeout_in_seconds
    }
  }
}
