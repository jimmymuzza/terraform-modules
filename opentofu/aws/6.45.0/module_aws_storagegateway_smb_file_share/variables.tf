variable "storagegateway_smb_file_shares" {
  description = <<EOT
Map of storagegateway_smb_file_shares, attributes below
Required:
    - gateway_arn
    - location_arn
    - role_arn
Optional:
    - access_based_enumeration
    - admin_user_list
    - audit_destination_arn
    - authentication
    - bucket_region
    - case_sensitivity
    - default_storage_class
    - file_share_name
    - guess_mime_type_enabled
    - invalid_user_list
    - kms_encrypted
    - kms_key_arn
    - notification_policy
    - object_acl
    - oplocks_enabled
    - read_only
    - region
    - requester_pays
    - smb_acl_enabled
    - tags
    - tags_all
    - valid_user_list
    - vpc_endpoint_dns_name
    - cache_attributes
EOT

  type = map(object({
    gateway_arn              = string
    location_arn             = string
    role_arn                 = string
    access_based_enumeration = optional(bool)
    admin_user_list          = optional(set(string))
    audit_destination_arn    = optional(string)
    authentication           = optional(string)
    bucket_region            = optional(string)
    case_sensitivity         = optional(string)
    default_storage_class    = optional(string)
    file_share_name          = optional(string)
    guess_mime_type_enabled  = optional(bool)
    invalid_user_list        = optional(set(string))
    kms_encrypted            = optional(bool)
    kms_key_arn              = optional(string)
    notification_policy      = optional(string)
    object_acl               = optional(string)
    oplocks_enabled          = optional(bool)
    read_only                = optional(bool)
    region                   = optional(string)
    requester_pays           = optional(bool)
    smb_acl_enabled          = optional(bool)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
    valid_user_list          = optional(set(string))
    vpc_endpoint_dns_name    = optional(string)
    cache_attributes         = optional(list(object({
            cache_stale_timeout_in_seconds = optional(number)
        })))
  }))
}
