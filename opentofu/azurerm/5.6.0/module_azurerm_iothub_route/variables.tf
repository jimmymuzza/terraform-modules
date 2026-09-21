variable "iothub_routes" {
  description = <<EOT
Map of iothub_routes, attributes below
Required:
    - enabled
    - endpoint_names
    - iothub_name
    - name
    - resource_group_name
    - source
Optional:
    - condition
EOT

  type = map(object({
    enabled             = bool
    endpoint_names      = list(string)
    iothub_name         = string
    name                = string
    resource_group_name = string
    source              = string
    condition           = optional(string)
  }))
}
