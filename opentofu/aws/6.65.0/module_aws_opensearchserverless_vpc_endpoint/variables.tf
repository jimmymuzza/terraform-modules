variable "opensearchserverless_vpc_endpoints" {
  description = <<EOT
Map of opensearchserverless_vpc_endpoints, attributes below
Required:
    - name
    - subnet_ids
    - vpc_id
Optional:
    - region
    - security_group_ids
EOT

  type = map(object({
    name               = string
    subnet_ids         = set(string)
    vpc_id             = string
    region             = optional(string)
    security_group_ids = optional(set(string))
  }))
}
