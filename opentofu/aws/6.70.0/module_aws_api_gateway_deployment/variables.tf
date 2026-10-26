variable "api_gateway_deployments" {
  description = <<EOT
Map of api_gateway_deployments, attributes below
Required:
    - rest_api_id
Optional:
    - description
    - region
    - triggers
    - variables
EOT

  type = map(object({
    rest_api_id = string
    description = optional(string)
    region      = optional(string)
    triggers    = optional(map(string))
    variables   = optional(map(string))
  }))
}
