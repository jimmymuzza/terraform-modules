variable "iothub_consumer_groups" {
  description = <<EOT
Map of iothub_consumer_groups, attributes below
Required:
    - eventhub_endpoint_name
    - iothub_name
    - name
    - resource_group_name
EOT

  type = map(object({
    eventhub_endpoint_name = string
    iothub_name            = string
    name                   = string
    resource_group_name    = string
  }))
}
