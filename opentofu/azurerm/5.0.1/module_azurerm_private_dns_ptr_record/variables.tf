variable "private_dns_ptr_records" {
  description = <<EOT
Map of private_dns_ptr_records, attributes below
Required:
    - name
    - private_dns_zone_id
    - records
    - ttl
Optional:
    - tags
EOT

  type = map(object({
    name                = string
    private_dns_zone_id = string
    records             = set(string)
    ttl                 = number
    tags                = optional(map(string))
  }))
}
