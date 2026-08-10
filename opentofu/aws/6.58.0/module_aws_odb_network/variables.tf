variable "odb_networks" {
  description = <<EOT
Map of odb_networks, attributes below
Required:
    - availability_zone_id
    - backup_subnet_cidr
    - client_subnet_cidr
    - display_name
    - s3_access
    - zero_etl_access
Optional:
    - availability_zone
    - cross_region_s3_restore_sources_access
    - custom_domain_name
    - default_dns_prefix
    - delete_associated_resources
    - kms_access
    - kms_policy_document
    - region
    - s3_policy_document
    - sts_access
    - sts_policy_document
    - tags
EOT

  type = map(object({
    availability_zone_id                   = string
    backup_subnet_cidr                     = string
    client_subnet_cidr                     = string
    display_name                           = string
    s3_access                              = string
    zero_etl_access                        = string
    availability_zone                      = optional(string)
    cross_region_s3_restore_sources_access = optional(set(string))
    custom_domain_name                     = optional(string)
    default_dns_prefix                     = optional(string)
    delete_associated_resources            = optional(bool)
    kms_access                             = optional(string)
    kms_policy_document                    = optional(string)
    region                                 = optional(string)
    s3_policy_document                     = optional(string)
    sts_access                             = optional(string)
    sts_policy_document                    = optional(string)
    tags                                   = optional(map(string))
  }))
}
