variable "vpclattice_access_log_subscriptions" {
  description = <<EOT
Map of vpclattice_access_log_subscriptions, attributes below
Required:
    - destination_arn
    - resource_identifier
Optional:
    - region
    - service_network_log_type
    - tags
    - tags_all
EOT

  type = map(object({
    destination_arn          = string
    resource_identifier      = string
    region                   = optional(string)
    service_network_log_type = optional(string)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
  }))
}
