variable "quicksight_vpc_connections" {
  description = <<EOT
Map of quicksight_vpc_connections, attributes below
Required:
    - name
    - role_arn
    - security_group_ids
    - subnet_ids
    - vpc_connection_id
Optional:
    - aws_account_id
    - dns_resolvers
    - region
    - tags
EOT

  type = map(object({
    name               = string
    role_arn           = string
    security_group_ids = set(string)
    subnet_ids         = set(string)
    vpc_connection_id  = string
    aws_account_id     = optional(string)
    dns_resolvers      = optional(set(string))
    region             = optional(string)
    tags               = optional(map(string))
  }))
}
