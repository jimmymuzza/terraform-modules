variable "api_management_diagnostics" {
  description = <<EOT
Map of api_management_diagnostics, attributes below
Required:
    - api_management_logger_id
    - api_management_name
    - identifier
    - resource_group_name
Optional:
    - always_log_errors
    - http_correlation_protocol
    - log_client_ip
    - operation_name_format
    - sampling_percentage
    - verbosity
    - backend_request
    - backend_response
    - frontend_request
    - frontend_response
EOT

  type = map(object({
    api_management_logger_id  = string
    api_management_name       = string
    identifier                = string
    resource_group_name       = string
    always_log_errors         = optional(bool)
    http_correlation_protocol = optional(string)
    log_client_ip             = optional(bool)
    operation_name_format     = optional(string)
    sampling_percentage       = optional(number)
    verbosity                 = optional(string)
    backend_request           = optional(list(object({
            body_bytes     = optional(number)
            headers_to_log = optional(set(string))
            data_masking   = optional(list(object({
                headers      = optional(list(object({
                    mode  = string
                    value = string
                })))
                query_params = optional(list(object({
                    mode  = string
                    value = string
                })))
            })))
        })))
    backend_response          = optional(list(object({
            body_bytes     = optional(number)
            headers_to_log = optional(set(string))
            data_masking   = optional(list(object({
                headers      = optional(list(object({
                    mode  = string
                    value = string
                })))
                query_params = optional(list(object({
                    mode  = string
                    value = string
                })))
            })))
        })))
    frontend_request          = optional(list(object({
            body_bytes     = optional(number)
            headers_to_log = optional(set(string))
            data_masking   = optional(list(object({
                headers      = optional(list(object({
                    mode  = string
                    value = string
                })))
                query_params = optional(list(object({
                    mode  = string
                    value = string
                })))
            })))
        })))
    frontend_response         = optional(list(object({
            body_bytes     = optional(number)
            headers_to_log = optional(set(string))
            data_masking   = optional(list(object({
                headers      = optional(list(object({
                    mode  = string
                    value = string
                })))
                query_params = optional(list(object({
                    mode  = string
                    value = string
                })))
            })))
        })))
  }))
}
