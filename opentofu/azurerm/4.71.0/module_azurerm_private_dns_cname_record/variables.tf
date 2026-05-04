variable "private_dns_cname_records" {
  description = <<EOT
Map of private_dns_cname_records, attributes below
Required:
    - name
    - record
    - resource_group_name
    - ttl
    - zone_name
Optional:
    - tags
EOT

  type = map(object({
    name                = string
    record              = string
    resource_group_name = string
    ttl                 = number
    zone_name           = string
    tags                = optional(map(string))
  }))
}
