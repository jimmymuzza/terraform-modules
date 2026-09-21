variable "storagegateway_nfs_file_shares" {
  description = <<EOT
Map of storagegateway_nfs_file_shares, attributes below
Required:
    - client_list
    - gateway_arn
    - location_arn
    - role_arn
Optional:
    - audit_destination_arn
    - bucket_region
    - default_storage_class
    - file_share_name
    - guess_mime_type_enabled
    - kms_encrypted
    - kms_key_arn
    - notification_policy
    - object_acl
    - read_only
    - region
    - requester_pays
    - squash
    - tags
    - tags_all
    - vpc_endpoint_dns_name
    - cache_attributes
    - nfs_file_share_defaults
EOT

  type = map(object({
    client_list             = set(string)
    gateway_arn             = string
    location_arn            = string
    role_arn                = string
    audit_destination_arn   = optional(string)
    bucket_region           = optional(string)
    default_storage_class   = optional(string)
    file_share_name         = optional(string)
    guess_mime_type_enabled = optional(bool)
    kms_encrypted           = optional(bool)
    kms_key_arn             = optional(string)
    notification_policy     = optional(string)
    object_acl              = optional(string)
    read_only               = optional(bool)
    region                  = optional(string)
    requester_pays          = optional(bool)
    squash                  = optional(string)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
    vpc_endpoint_dns_name   = optional(string)
    cache_attributes        = optional(list(object({
            cache_stale_timeout_in_seconds = optional(number)
        })))
    nfs_file_share_defaults = optional(list(object({
            directory_mode = optional(string)
            file_mode      = optional(string)
            group_id       = optional(string)
            owner_id       = optional(string)
        })))
  }))
}
