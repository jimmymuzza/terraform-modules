variable "monitor_private_link_scoped_services" {
  description = <<EOT
Map of monitor_private_link_scoped_services, attributes below
Required:
    - linked_resource_id
    - name
    - resource_group_name
    - scope_name
EOT

  type = map(object({
    linked_resource_id  = string
    name                = string
    resource_group_name = string
    scope_name          = string
  }))
}
