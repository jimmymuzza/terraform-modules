variable "iothub_endpoint_servicebus_queues" {
  description = <<EOT
Map of iothub_endpoint_servicebus_queues, attributes below
Required:
    - iothub_id
    - name
    - resource_group_name
Optional:
    - authentication_type
    - connection_string
    - endpoint_uri
    - entity_path
    - identity_id
    - subscription_id
EOT

  type = map(object({
    iothub_id           = string
    name                = string
    resource_group_name = string
    authentication_type = optional(string)
    connection_string   = optional(string)
    endpoint_uri        = optional(string)
    entity_path         = optional(string)
    identity_id         = optional(string)
    subscription_id     = optional(string)
  }))
}
