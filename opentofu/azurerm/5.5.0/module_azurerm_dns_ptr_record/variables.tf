variable "dns_ptr_records" {
  description = <<EOT
Map of dns_ptr_records, attributes below
Required:
    - name
    - records
    - resource_group_name
    - ttl
    - zone_name
Optional:
    - tags
EOT

  type = map(object({
    name                = string
    records             = set(string)
    resource_group_name = string
    ttl                 = number
    zone_name           = string
    tags                = optional(map(string))
  }))
}
