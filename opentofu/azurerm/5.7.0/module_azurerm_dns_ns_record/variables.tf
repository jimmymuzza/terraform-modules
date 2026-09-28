variable "dns_ns_records" {
  description = <<EOT
Map of dns_ns_records, attributes below
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
    records             = list(string)
    resource_group_name = string
    ttl                 = number
    zone_name           = string
    tags                = optional(map(string))
  }))
}
