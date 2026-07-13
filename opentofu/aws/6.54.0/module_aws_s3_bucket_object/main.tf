resource "aws_s3_bucket_object" "s3_bucket_objects" {
  for_each = var.s3_bucket_objects

  bucket                        = each.value.bucket
  key                           = each.value.key
  acl                           = each.value.acl
  bucket_key_enabled            = each.value.bucket_key_enabled
  cache_control                 = each.value.cache_control
  content                       = each.value.content
  content_base64                = each.value.content_base64
  content_disposition           = each.value.content_disposition
  content_encoding              = each.value.content_encoding
  content_language              = each.value.content_language
  content_type                  = each.value.content_type
  etag                          = each.value.etag
  force_destroy                 = each.value.force_destroy
  kms_key_id                    = each.value.kms_key_id
  metadata                      = each.value.metadata
  object_lock_legal_hold_status = each.value.object_lock_legal_hold_status
  object_lock_mode              = each.value.object_lock_mode
  object_lock_retain_until_date = each.value.object_lock_retain_until_date
  region                        = each.value.region
  server_side_encryption        = each.value.server_side_encryption
  source                        = each.value.source
  source_hash                   = each.value.source_hash
  storage_class                 = each.value.storage_class
  tags                          = each.value.tags
  tags_all                      = each.value.tags_all
  website_redirect              = each.value.website_redirect
}
