variable "s3outposts_endpoints" {
  description = <<EOT
Map of s3outposts_endpoints, attributes below
Required:
    - outpost_id
    - security_group_id
    - subnet_id
Optional:
    - access_type
    - customer_owned_ipv4_pool
    - region
EOT

  type = map(object({
    outpost_id               = string
    security_group_id        = string
    subnet_id                = string
    access_type              = optional(string)
    customer_owned_ipv4_pool = optional(string)
    region                   = optional(string)
  }))
}
