variable "apprunner_vpc_connectors" {
  description = <<EOT
Map of apprunner_vpc_connectors, attributes below
Required:
    - security_groups
    - subnets
    - vpc_connector_name
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    security_groups    = set(string)
    subnets            = set(string)
    vpc_connector_name = string
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
  }))
}
