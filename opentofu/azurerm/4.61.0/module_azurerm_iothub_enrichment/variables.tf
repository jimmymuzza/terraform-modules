variable "iothub_enrichments" {
  description = <<EOT
Map of iothub_enrichments, attributes below
Required:
    - endpoint_names
    - iothub_name
    - key
    - resource_group_name
    - value
EOT

  type = map(object({
    endpoint_names      = list(string)
    iothub_name         = string
    key                 = string
    resource_group_name = string
    value               = string
  }))
}
