variable "sesv2_configuration_sets" {
  description = <<EOT
Map of sesv2_configuration_sets, attributes below
Required:
    - configuration_set_name
Optional:
    - region
    - tags
    - tags_all
    - delivery_options
    - reputation_options
    - sending_options
    - suppression_options
    - tracking_options
    - vdm_options
EOT

  type = map(object({
    configuration_set_name = string
    region                 = optional(string)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    delivery_options       = optional(list(object({
            max_delivery_seconds = optional(number)
            sending_pool_name    = optional(string)
            tls_policy           = optional(string)
        })))
    reputation_options     = optional(list(object({
            reputation_metrics_enabled = optional(bool)
        })))
    sending_options        = optional(list(object({
            sending_enabled = optional(bool)
        })))
    suppression_options    = optional(list(object({
            suppressed_reasons = optional(list(string))
        })))
    tracking_options       = optional(list(object({
            custom_redirect_domain = string
            https_policy           = optional(string)
        })))
    vdm_options            = optional(list(object({
            dashboard_options = optional(list(object({
                engagement_metrics = optional(string)
            })))
            guardian_options  = optional(list(object({
                optimized_shared_delivery = optional(string)
            })))
        })))
  }))
}
