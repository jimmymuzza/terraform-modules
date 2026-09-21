variable "api_gateway_models" {
  description = <<EOT
Map of api_gateway_models, attributes below
Required:
    - content_type
    - name
    - rest_api_id
Optional:
    - description
    - region
    - schema
EOT

  type = map(object({
    content_type = string
    name         = string
    rest_api_id  = string
    description  = optional(string)
    region       = optional(string)
    schema       = optional(string)
  }))
}
