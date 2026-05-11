variable "iothub_fallback_routes" {
  description = <<EOT
Map of iothub_fallback_routes, attributes below
Required:
    - enabled
    - endpoint_names
    - iothub_name
    - resource_group_name
Optional:
    - condition
    - source
EOT

  type = map(object({
    enabled             = bool
    endpoint_names      = list(string)
    iothub_name         = string
    resource_group_name = string
    condition           = optional(string)
    source              = optional(string)
  }))
}
