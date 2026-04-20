variable "dns_zones" {
  description = <<EOT
Map of dns_zones, attributes below
Required:
    - name
    - resource_group_name
Optional:
    - tags
    - soa_record
EOT

  type = map(object({
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
    soa_record          = optional(list(object({
            email         = string
            expire_time   = optional(number)
            minimum_ttl   = optional(number)
            refresh_time  = optional(number)
            retry_time    = optional(number)
            serial_number = optional(number)
            tags          = optional(map(string))
            ttl           = optional(number)
        })))
  }))
}
