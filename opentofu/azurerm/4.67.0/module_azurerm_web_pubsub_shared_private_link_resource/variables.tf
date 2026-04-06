variable "web_pubsub_shared_private_link_resources" {
  description = <<EOT
Map of web_pubsub_shared_private_link_resources, attributes below
Required:
    - name
    - subresource_name
    - target_resource_id
    - web_pubsub_id
Optional:
    - request_message
EOT

  type = map(object({
    name               = string
    subresource_name   = string
    target_resource_id = string
    web_pubsub_id      = string
    request_message    = optional(string)
  }))
}
