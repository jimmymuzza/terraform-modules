variable "api_gateway_stages" {
  description = <<EOT
Map of api_gateway_stages, attributes below
Required:
    - deployment_id
    - rest_api_id
    - stage_name
Optional:
    - cache_cluster_enabled
    - cache_cluster_size
    - client_certificate_id
    - description
    - documentation_version
    - region
    - tags
    - tags_all
    - variables
    - xray_tracing_enabled
    - access_log_settings
    - canary_settings
EOT

  type = map(object({
    deployment_id         = string
    rest_api_id           = string
    stage_name            = string
    cache_cluster_enabled = optional(bool)
    cache_cluster_size    = optional(string)
    client_certificate_id = optional(string)
    description           = optional(string)
    documentation_version = optional(string)
    region                = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    variables             = optional(map(string))
    xray_tracing_enabled  = optional(bool)
    access_log_settings   = optional(list(object({
            destination_arn = string
            format          = string
        })))
    canary_settings       = optional(list(object({
            deployment_id            = string
            percent_traffic          = optional(number)
            stage_variable_overrides = optional(map(string))
            use_stage_cache          = optional(bool)
        })))
  }))
}
