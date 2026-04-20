variable "portal_dashboards" {
  description = <<EOT
Map of portal_dashboards, attributes below
Required:
    - dashboard_properties
    - location
    - name
    - resource_group_name
Optional:
    - tags
EOT

  type = map(object({
    dashboard_properties = string
    location             = string
    name                 = string
    resource_group_name  = string
    tags                 = optional(map(string))
  }))
}
