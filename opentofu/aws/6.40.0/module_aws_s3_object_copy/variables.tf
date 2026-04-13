variable "s3_object_copies" {
  description = <<EOT
Map of s3_object_copies, attributes below
Required:
    - bucket
    - key
    - source
Optional:
    - acl
    - bucket_key_enabled
    - cache_control
    - checksum_algorithm
    - content_disposition
    - content_encoding
    - content_language
    - content_type
    - copy_if_match
    - copy_if_modified_since
    - copy_if_none_match
    - copy_if_unmodified_since
    - customer_algorithm
    - customer_key
    - customer_key_md5
    - expected_bucket_owner
    - expected_source_bucket_owner
    - expires
    - force_destroy
    - kms_encryption_context
    - kms_key_id
    - metadata
    - metadata_directive
    - object_lock_legal_hold_status
    - object_lock_mode
    - object_lock_retain_until_date
    - region
    - request_payer
    - server_side_encryption
    - source_customer_algorithm
    - source_customer_key
    - source_customer_key_md5
    - storage_class
    - tagging_directive
    - tags
    - tags_all
    - website_redirect
    - grant
    - override_provider
EOT

  type = map(object({
    bucket                        = string
    key                           = string
    source                        = string
    acl                           = optional(string)
    bucket_key_enabled            = optional(bool)
    cache_control                 = optional(string)
    checksum_algorithm            = optional(string)
    content_disposition           = optional(string)
    content_encoding              = optional(string)
    content_language              = optional(string)
    content_type                  = optional(string)
    copy_if_match                 = optional(string)
    copy_if_modified_since        = optional(string)
    copy_if_none_match            = optional(string)
    copy_if_unmodified_since      = optional(string)
    customer_algorithm            = optional(string)
    customer_key                  = optional(string)
    customer_key_md5              = optional(string)
    expected_bucket_owner         = optional(string)
    expected_source_bucket_owner  = optional(string)
    expires                       = optional(string)
    force_destroy                 = optional(bool)
    kms_encryption_context        = optional(string)
    kms_key_id                    = optional(string)
    metadata                      = optional(map(string))
    metadata_directive            = optional(string)
    object_lock_legal_hold_status = optional(string)
    object_lock_mode              = optional(string)
    object_lock_retain_until_date = optional(string)
    region                        = optional(string)
    request_payer                 = optional(string)
    server_side_encryption        = optional(string)
    source_customer_algorithm     = optional(string)
    source_customer_key           = optional(string)
    source_customer_key_md5       = optional(string)
    storage_class                 = optional(string)
    tagging_directive             = optional(string)
    tags                          = optional(map(string))
    tags_all                      = optional(map(string))
    website_redirect              = optional(string)
    grant                         = optional(set(object({
            permissions = set(string)
            type        = string
            email       = optional(string)
            uri         = optional(string)
        })))
    override_provider             = optional(list(object({
            default_tags = optional(list(object({
                tags = optional(map(string))
            })))
        })))
  }))
}
