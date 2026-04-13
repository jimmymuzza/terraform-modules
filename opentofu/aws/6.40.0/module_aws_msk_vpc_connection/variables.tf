variable "msk_vpc_connections" {
  description = <<EOT
Map of msk_vpc_connections, attributes below
Required:
    - authentication
    - client_subnets
    - security_groups
    - target_cluster_arn
    - vpc_id
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    authentication     = string
    client_subnets     = set(string)
    security_groups    = set(string)
    target_cluster_arn = string
    vpc_id             = string
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
  }))
}
