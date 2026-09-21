variable "dashboard_grafana_managed_private_endpoints" {
  description = <<EOT
Map of dashboard_grafana_managed_private_endpoints, attributes below
Required:
    - grafana_id
    - location
    - name
    - private_link_resource_id
Optional:
    - group_ids
    - private_link_resource_region
    - private_link_service_url
    - request_message
    - tags
EOT

  type = map(object({
    grafana_id                   = string
    location                     = string
    name                         = string
    private_link_resource_id     = string
    group_ids                    = optional(list(string))
    private_link_resource_region = optional(string)
    private_link_service_url     = optional(string)
    request_message              = optional(string)
    tags                         = optional(map(string))
  }))
}
