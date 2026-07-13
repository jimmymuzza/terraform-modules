variable "dns_a_records" {
  description = <<EOT
Map of dns_a_records, attributes below
Required:
    - name
    - resource_group_name
    - ttl
    - zone_name
Optional:
    - records
    - tags
    - target_resource_id
EOT

  type = map(object({
    name                = string
    resource_group_name = string
    ttl                 = number
    zone_name           = string
    records             = optional(set(string))
    tags                = optional(map(string))
    target_resource_id  = optional(string)
  }))
}
