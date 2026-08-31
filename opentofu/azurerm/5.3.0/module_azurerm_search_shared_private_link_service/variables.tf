variable "search_shared_private_link_services" {
  description = <<EOT
Map of search_shared_private_link_services, attributes below
Required:
    - name
    - search_service_id
    - subresource_name
    - target_resource_id
Optional:
    - request_message
EOT

  type = map(object({
    name               = string
    search_service_id  = string
    subresource_name   = string
    target_resource_id = string
    request_message    = optional(string)
  }))
}
