variable "iothub_shared_access_policies" {
  description = <<EOT
Map of iothub_shared_access_policies, attributes below
Required:
    - iothub_name
    - name
    - resource_group_name
Optional:
    - device_connect
    - registry_read
    - registry_write
    - service_connect
EOT

  type = map(object({
    iothub_name         = string
    name                = string
    resource_group_name = string
    device_connect      = optional(bool)
    registry_read       = optional(bool)
    registry_write      = optional(bool)
    service_connect     = optional(bool)
  }))
}
