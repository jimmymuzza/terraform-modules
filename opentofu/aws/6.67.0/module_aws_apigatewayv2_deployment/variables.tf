variable "apigatewayv2_deployments" {
  description = <<EOT
Map of apigatewayv2_deployments, attributes below
Required:
    - api_id
Optional:
    - description
    - region
    - triggers
EOT

  type = map(object({
    api_id      = string
    description = optional(string)
    region      = optional(string)
    triggers    = optional(map(string))
  }))
}
