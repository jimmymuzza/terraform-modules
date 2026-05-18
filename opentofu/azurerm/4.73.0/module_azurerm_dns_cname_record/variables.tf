variable "dns_cname_records" {
  description = <<EOT
Map of dns_cname_records, attributes below
Required:
    - name
    - resource_group_name
    - ttl
    - zone_name
Optional:
    - record
    - tags
    - target_resource_id
EOT

  type = map(object({
    name                = string
    resource_group_name = string
    ttl                 = number
    zone_name           = string
    record              = optional(string)
    tags                = optional(map(string))
    target_resource_id  = optional(string)
  }))
}
