variable "vpc_ipam_pools" {
  description = <<EOT
Map of vpc_ipam_pools, attributes below
Required:
    - address_family
    - ipam_scope_id
Optional:
    - allocation_default_netmask_length
    - allocation_max_netmask_length
    - allocation_min_netmask_length
    - allocation_resource_tags
    - auto_import
    - aws_service
    - cascade
    - description
    - locale
    - public_ip_source
    - publicly_advertisable
    - region
    - source_ipam_pool_id
    - tags
    - tags_all
    - source_resource
EOT

  type = map(object({
    address_family                    = string
    ipam_scope_id                     = string
    allocation_default_netmask_length = optional(number)
    allocation_max_netmask_length     = optional(number)
    allocation_min_netmask_length     = optional(number)
    allocation_resource_tags          = optional(map(string))
    auto_import                       = optional(bool)
    aws_service                       = optional(string)
    cascade                           = optional(bool)
    description                       = optional(string)
    locale                            = optional(string)
    public_ip_source                  = optional(string)
    publicly_advertisable             = optional(bool)
    region                            = optional(string)
    source_ipam_pool_id               = optional(string)
    tags                              = optional(map(string))
    tags_all                          = optional(map(string))
    source_resource                   = optional(list(object({
            resource_id     = string
            resource_owner  = string
            resource_region = string
            resource_type   = string
        })))
  }))
}
