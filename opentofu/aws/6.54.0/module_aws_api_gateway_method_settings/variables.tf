variable "api_gateway_method_settings" {
  description = <<EOT
Map of api_gateway_method_settings, attributes below
Required:
    - method_path
    - rest_api_id
    - stage_name
    - settings
Optional:
    - region
EOT

  type = map(object({
    method_path = string
    rest_api_id = string
    stage_name  = string
    region      = optional(string)
    settings    = list(object({
            cache_data_encrypted                       = optional(bool)
            cache_ttl_in_seconds                       = optional(number)
            caching_enabled                            = optional(bool)
            data_trace_enabled                         = optional(bool)
            logging_level                              = optional(string)
            metrics_enabled                            = optional(bool)
            require_authorization_for_cache_control    = optional(bool)
            throttling_burst_limit                     = optional(number)
            throttling_rate_limit                      = optional(number)
            unauthorized_cache_control_header_strategy = optional(string)
        }))
  }))
}
