variable "route53_health_checks" {
  description = <<EOT
Map of route53_health_checks, attributes below
Required:
    - type
Optional:
    - child_health_threshold
    - child_healthchecks
    - cloudwatch_alarm_name
    - cloudwatch_alarm_region
    - disabled
    - enable_sni
    - failure_threshold
    - fqdn
    - insufficient_data_health_status
    - invert_healthcheck
    - ip_address
    - measure_latency
    - port
    - reference_name
    - regions
    - request_interval
    - resource_path
    - routing_control_arn
    - search_string
    - tags
    - tags_all
    - triggers
EOT

  type = map(object({
    type                            = string
    child_health_threshold          = optional(number)
    child_healthchecks              = optional(set(string))
    cloudwatch_alarm_name           = optional(string)
    cloudwatch_alarm_region         = optional(string)
    disabled                        = optional(bool)
    enable_sni                      = optional(bool)
    failure_threshold               = optional(number)
    fqdn                            = optional(string)
    insufficient_data_health_status = optional(string)
    invert_healthcheck              = optional(bool)
    ip_address                      = optional(string)
    measure_latency                 = optional(bool)
    port                            = optional(number)
    reference_name                  = optional(string)
    regions                         = optional(set(string))
    request_interval                = optional(number)
    resource_path                   = optional(string)
    routing_control_arn             = optional(string)
    search_string                   = optional(string)
    tags                            = optional(map(string))
    tags_all                        = optional(map(string))
    triggers                        = optional(map(string))
  }))
}
