variable "app_service_active_slots" {
  description = <<EOT
Map of app_service_active_slots, attributes below
Required:
    - app_service_name
    - app_service_slot_name
    - resource_group_name
EOT

  type = map(object({
    app_service_name      = string
    app_service_slot_name = string
    resource_group_name   = string
  }))
}
