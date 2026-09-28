variable "ses_configuration_sets" {
  description = <<EOT
Map of ses_configuration_sets, attributes below
Required:
    - name
Optional:
    - region
    - reputation_metrics_enabled
    - sending_enabled
    - delivery_options
    - tracking_options
EOT

  type = map(object({
    name                       = string
    region                     = optional(string)
    reputation_metrics_enabled = optional(bool)
    sending_enabled            = optional(bool)
    delivery_options           = optional(list(object({
            tls_policy = optional(string)
        })))
    tracking_options           = optional(list(object({
            custom_redirect_domain = optional(string)
        })))
  }))
}
