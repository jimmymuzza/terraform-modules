variable "api_gateway_base_path_mappings" {
  description = <<EOT
Map of api_gateway_base_path_mappings, attributes below
Required:
    - api_id
    - domain_name
Optional:
    - base_path
    - domain_name_id
    - region
    - stage_name
EOT

  type = map(object({
    api_id         = string
    domain_name    = string
    base_path      = optional(string)
    domain_name_id = optional(string)
    region         = optional(string)
    stage_name     = optional(string)
  }))
}
