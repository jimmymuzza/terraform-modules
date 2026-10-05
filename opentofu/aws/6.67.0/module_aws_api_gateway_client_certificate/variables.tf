variable "api_gateway_client_certificates" {
  description = <<EOT
Map of api_gateway_client_certificates, attributes below
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
  }))
}
