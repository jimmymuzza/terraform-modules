variable "dns_txt_records" {
  description = <<EOT
Map of dns_txt_records, attributes below
Required:
    - name
    - resource_group_name
    - ttl
    - zone_name
    - record
Optional:
    - tags
EOT

  type = map(object({
    name                = string
    resource_group_name = string
    ttl                 = number
    zone_name           = string
    tags                = optional(map(string))
    record              = set(object({
            value = string
        }))
  }))
}
