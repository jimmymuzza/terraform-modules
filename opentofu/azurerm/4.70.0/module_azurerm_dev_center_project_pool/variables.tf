variable "dev_center_project_pools" {
  description = <<EOT
Map of dev_center_project_pools, attributes below
Required:
    - dev_box_definition_name
    - dev_center_attached_network_name
    - dev_center_project_id
    - local_administrator_enabled
    - location
    - name
Optional:
    - managed_virtual_network_regions
    - single_sign_on_enabled
    - stop_on_disconnect_grace_period_minutes
    - tags
EOT

  type = map(object({
    dev_box_definition_name                 = string
    dev_center_attached_network_name        = string
    dev_center_project_id                   = string
    local_administrator_enabled             = bool
    location                                = string
    name                                    = string
    managed_virtual_network_regions         = optional(list(string))
    single_sign_on_enabled                  = optional(bool)
    stop_on_disconnect_grace_period_minutes = optional(number)
    tags                                    = optional(map(string))
  }))
}
