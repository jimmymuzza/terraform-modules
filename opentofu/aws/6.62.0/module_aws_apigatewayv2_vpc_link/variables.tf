variable "apigatewayv2_vpc_links" {
  description = <<EOT
Map of apigatewayv2_vpc_links, attributes below
Required:
    - name
    - security_group_ids
    - subnet_ids
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name               = string
    security_group_ids = set(string)
    subnet_ids         = set(string)
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
  }))
}
