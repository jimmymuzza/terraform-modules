resource "azurerm_storage_blob" "storage_blobs" {
  for_each = var.storage_blobs

  name                 = each.value.name
  storage_container_id = each.value.storage_container_id
  type                 = each.value.type
  access_tier          = each.value.access_tier
  cache_control        = each.value.cache_control
  content_md5          = each.value.content_md5
  content_type         = each.value.content_type
  encryption_scope     = each.value.encryption_scope
  metadata             = each.value.metadata
  parallelism          = each.value.parallelism
  size                 = each.value.size
  source               = each.value.source
  source_content       = each.value.source_content
  source_uri           = each.value.source_uri
}
