resource "aws_s3_object_copy" "s3_object_copies" {
  for_each = var.s3_object_copies

  bucket                        = each.value.bucket
  key                           = each.value.key
  source                        = each.value.source
  acl                           = each.value.acl
  bucket_key_enabled            = each.value.bucket_key_enabled
  cache_control                 = each.value.cache_control
  checksum_algorithm            = each.value.checksum_algorithm
  content_disposition           = each.value.content_disposition
  content_encoding              = each.value.content_encoding
  content_language              = each.value.content_language
  content_type                  = each.value.content_type
  copy_if_match                 = each.value.copy_if_match
  copy_if_modified_since        = each.value.copy_if_modified_since
  copy_if_none_match            = each.value.copy_if_none_match
  copy_if_unmodified_since      = each.value.copy_if_unmodified_since
  customer_algorithm            = each.value.customer_algorithm
  customer_key                  = each.value.customer_key
  customer_key_md5              = each.value.customer_key_md5
  expected_bucket_owner         = each.value.expected_bucket_owner
  expected_source_bucket_owner  = each.value.expected_source_bucket_owner
  expires                       = each.value.expires
  force_destroy                 = each.value.force_destroy
  kms_encryption_context        = each.value.kms_encryption_context
  kms_key_id                    = each.value.kms_key_id
  metadata                      = each.value.metadata
  metadata_directive            = each.value.metadata_directive
  object_lock_legal_hold_status = each.value.object_lock_legal_hold_status
  object_lock_mode              = each.value.object_lock_mode
  object_lock_retain_until_date = each.value.object_lock_retain_until_date
  region                        = each.value.region
  request_payer                 = each.value.request_payer
  server_side_encryption        = each.value.server_side_encryption
  source_customer_algorithm     = each.value.source_customer_algorithm
  source_customer_key           = each.value.source_customer_key
  source_customer_key_md5       = each.value.source_customer_key_md5
  storage_class                 = each.value.storage_class
  tagging_directive             = each.value.tagging_directive
  tags                          = each.value.tags
  tags_all                      = each.value.tags_all
  website_redirect              = each.value.website_redirect

  dynamic "grant" {
    for_each = each.value.grant != null ? each.value.grant : []
    content {
      permissions = grant.value.permissions
      type        = grant.value.type
      email       = grant.value.email
      uri         = grant.value.uri
    }
  }

  dynamic "override_provider" {
    for_each = each.value.override_provider != null ? each.value.override_provider : []
    content {

      dynamic "default_tags" {
        for_each = override_provider.value.default_tags != null ? override_provider.value.default_tags : []
        content {
          tags = default_tags.value.tags
        }
      }
    }
  }
}
