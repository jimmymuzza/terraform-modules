variable "db_proxy_endpoints" {
  description = <<EOT
Map of db_proxy_endpoints, attributes below
Required:
    - db_proxy_endpoint_name
    - db_proxy_name
    - vpc_subnet_ids
Optional:
    - region
    - tags
    - tags_all
    - target_role
    - vpc_security_group_ids
EOT

  type = map(object({
    db_proxy_endpoint_name = string
    db_proxy_name          = string
    vpc_subnet_ids         = set(string)
    region                 = optional(string)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    target_role            = optional(string)
    vpc_security_group_ids = optional(set(string))
  }))
}
