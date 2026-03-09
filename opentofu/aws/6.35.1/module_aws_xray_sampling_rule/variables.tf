variable "xray_sampling_rules" {
  description = <<EOT
Map of xray_sampling_rules, attributes below
Required:
    - fixed_rate
    - host
    - http_method
    - priority
    - reservoir_size
    - resource_arn
    - service_name
    - service_type
    - url_path
    - version
Optional:
    - attributes
    - region
    - rule_name
    - tags
    - tags_all
EOT

  type = map(object({
    fixed_rate     = number
    host           = string
    http_method    = string
    priority       = number
    reservoir_size = number
    resource_arn   = string
    service_name   = string
    service_type   = string
    url_path       = string
    version        = number
    attributes     = optional(map(string))
    region         = optional(string)
    rule_name      = optional(string)
    tags           = optional(map(string))
    tags_all       = optional(map(string))
  }))
}
