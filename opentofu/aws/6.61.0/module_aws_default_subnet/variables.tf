variable "default_subnets" {
  description = <<EOT
Map of default_subnets, attributes below
Required:
    - availability_zone
Optional:
    - assign_ipv6_address_on_creation
    - customer_owned_ipv4_pool
    - enable_dns64
    - enable_resource_name_dns_a_record_on_launch
    - enable_resource_name_dns_aaaa_record_on_launch
    - force_destroy
    - ipv6_cidr_block
    - ipv6_native
    - map_customer_owned_ip_on_launch
    - map_public_ip_on_launch
    - private_dns_hostname_type_on_launch
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    availability_zone                              = string
    assign_ipv6_address_on_creation                = optional(bool)
    customer_owned_ipv4_pool                       = optional(string)
    enable_dns64                                   = optional(bool)
    enable_resource_name_dns_a_record_on_launch    = optional(bool)
    enable_resource_name_dns_aaaa_record_on_launch = optional(bool)
    force_destroy                                  = optional(bool)
    ipv6_cidr_block                                = optional(string)
    ipv6_native                                    = optional(bool)
    map_customer_owned_ip_on_launch                = optional(bool)
    map_public_ip_on_launch                        = optional(bool)
    private_dns_hostname_type_on_launch            = optional(string)
    region                                         = optional(string)
    tags                                           = optional(map(string))
    tags_all                                       = optional(map(string))
  }))
}
