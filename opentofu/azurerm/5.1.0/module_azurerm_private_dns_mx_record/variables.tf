variable "private_dns_mx_records" {
  description = <<EOT
Map of private_dns_mx_records, attributes below
Required:
    - private_dns_zone_id
    - ttl
    - record
Optional:
    - name
    - tags
EOT

  type = map(object({
    private_dns_zone_id = string
    ttl                 = number
    name                = optional(string)
    tags                = optional(map(string))
    record              = set(object({
            exchange   = string
            preference = number
        }))
  }))
}
