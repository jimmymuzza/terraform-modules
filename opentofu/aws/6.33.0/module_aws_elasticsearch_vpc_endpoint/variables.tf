variable "elasticsearch_vpc_endpoints" {
  description = <<EOT
Map of elasticsearch_vpc_endpoints, attributes below
Required:
    - domain_arn
    - vpc_options
Optional:
    - region
EOT

  type = map(object({
    domain_arn  = string
    region      = optional(string)
    vpc_options = list(object({
            subnet_ids         = set(string)
            security_group_ids = optional(set(string))
        }))
  }))
}
