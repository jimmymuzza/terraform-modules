variable "web_app_active_slots" {
  description = <<EOT
Map of web_app_active_slots, attributes below
Required:
    - slot_id
Optional:
    - overwrite_network_config
EOT

  type = map(object({
    slot_id                  = string
    overwrite_network_config = optional(bool)
  }))
}
