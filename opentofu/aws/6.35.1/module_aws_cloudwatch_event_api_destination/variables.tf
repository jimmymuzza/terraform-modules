variable "cloudwatch_event_api_destinations" {
  description = <<EOT
Map of cloudwatch_event_api_destinations, attributes below
Required:
    - connection_arn
    - http_method
    - invocation_endpoint
    - name
Optional:
    - description
    - invocation_rate_limit_per_second
    - region
EOT

  type = map(object({
    connection_arn                   = string
    http_method                      = string
    invocation_endpoint              = string
    name                             = string
    description                      = optional(string)
    invocation_rate_limit_per_second = optional(number)
    region                           = optional(string)
  }))
}
