resource "azurerm_storage_share_file" "storage_share_files" {
  for_each = var.storage_share_files

  name                = each.value.name
  content_disposition = each.value.content_disposition
  content_encoding    = each.value.content_encoding
  content_md5         = each.value.content_md5
  content_type        = each.value.content_type
  metadata            = each.value.metadata
  path                = each.value.path
  source              = each.value.source
  storage_share_id    = each.value.storage_share_id
  storage_share_url   = each.value.storage_share_url
}
