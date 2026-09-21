variable "signalr_shared_private_link_resources" {
  description = <<EOT
Map of signalr_shared_private_link_resources, attributes below
Required:
    - name
    - signalr_service_id
    - sub_resource_name
    - target_resource_id
Optional:
    - request_message
EOT

  type = map(object({
    name               = string
    signalr_service_id = string
    sub_resource_name  = string
    target_resource_id = string
    request_message    = optional(string)
  }))
}
