variable "cloudfront_response_headers_policies" {
  description = <<EOT
Map of cloudfront_response_headers_policies, attributes below
Required:
    - name
Optional:
    - comment
    - cors_config
    - custom_headers_config
    - remove_headers_config
    - security_headers_config
    - server_timing_headers_config
EOT

  type = map(object({
    name                         = string
    comment                      = optional(string)
    cors_config                  = optional(list(object({
            access_control_allow_credentials = bool
            origin_override                  = bool
            access_control_max_age_sec       = optional(number)
            access_control_allow_headers     = list(object({
                items = optional(set(string))
            }))
            access_control_allow_methods     = list(object({
                items = optional(set(string))
            }))
            access_control_allow_origins     = list(object({
                items = optional(set(string))
            }))
            access_control_expose_headers    = optional(list(object({
                items = optional(set(string))
            })))
        })))
    custom_headers_config        = optional(list(object({
            items = optional(set(object({
                header   = string
                override = bool
                value    = string
            })))
        })))
    remove_headers_config        = optional(list(object({
            items = optional(set(object({
                header = string
            })))
        })))
    security_headers_config      = optional(list(object({
            content_security_policy   = optional(list(object({
                content_security_policy = string
                override                = bool
            })))
            content_type_options      = optional(list(object({
                override = bool
            })))
            frame_options             = optional(list(object({
                frame_option = string
                override     = bool
            })))
            referrer_policy           = optional(list(object({
                override        = bool
                referrer_policy = string
            })))
            strict_transport_security = optional(list(object({
                access_control_max_age_sec = number
                override                   = bool
                include_subdomains         = optional(bool)
                preload                    = optional(bool)
            })))
            xss_protection            = optional(list(object({
                override   = bool
                protection = bool
                mode_block = optional(bool)
                report_uri = optional(string)
            })))
        })))
    server_timing_headers_config = optional(list(object({
            enabled       = bool
            sampling_rate = number
        })))
  }))
}
