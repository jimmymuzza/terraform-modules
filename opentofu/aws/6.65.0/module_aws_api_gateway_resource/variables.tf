variable "api_gateway_resources" {
  description = <<EOT
Map of api_gateway_resources, attributes below
Required:
    - parent_id
    - path_part
    - rest_api_id
Optional:
    - region
EOT

  type = map(object({
    parent_id   = string
    path_part   = string
    rest_api_id = string
    region      = optional(string)
  }))
}
