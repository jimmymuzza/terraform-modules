variable "apigatewayv2_stages" {
  description = <<EOT
Map of apigatewayv2_stages, attributes below
Required:
    - api_id
    - name
Optional:
    - auto_deploy
    - client_certificate_id
    - deployment_id
    - description
    - region
    - stage_variables
    - tags
    - tags_all
    - access_log_settings
    - default_route_settings
    - route_settings
EOT

  type = map(object({
    api_id                 = string
    name                   = string
    auto_deploy            = optional(bool)
    client_certificate_id  = optional(string)
    deployment_id          = optional(string)
    description            = optional(string)
    region                 = optional(string)
    stage_variables        = optional(map(string))
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    access_log_settings    = optional(list(object({
            destination_arn = string
            format          = string
        })))
    default_route_settings = optional(list(object({
            data_trace_enabled       = optional(bool)
            detailed_metrics_enabled = optional(bool)
            logging_level            = optional(string)
            throttling_burst_limit   = optional(number)
            throttling_rate_limit    = optional(number)
        })))
    route_settings         = optional(set(object({
            route_key                = string
            data_trace_enabled       = optional(bool)
            detailed_metrics_enabled = optional(bool)
            logging_level            = optional(string)
            throttling_burst_limit   = optional(number)
            throttling_rate_limit    = optional(number)
        })))
  }))
}
