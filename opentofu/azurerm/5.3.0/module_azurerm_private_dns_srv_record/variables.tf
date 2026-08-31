variable "private_dns_srv_records" {
  description = <<EOT
Map of private_dns_srv_records, attributes below
Required:
    - name
    - private_dns_zone_id
    - ttl
    - record
Optional:
    - tags
EOT

  type = map(object({
    name                = string
    private_dns_zone_id = string
    ttl                 = number
    tags                = optional(map(string))
    record              = set(object({
            port     = number
            priority = number
            target   = string
            weight   = number
        }))
  }))
}
