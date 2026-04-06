variable "log_analytics_linked_services" {
  description = <<EOT
Map of log_analytics_linked_services, attributes below
Required:
    - resource_group_name
    - workspace_id
Optional:
    - read_access_id
    - write_access_id
EOT

  type = map(object({
    resource_group_name = string
    workspace_id        = string
    read_access_id      = optional(string)
    write_access_id     = optional(string)
  }))
}
