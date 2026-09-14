variable "maintenance_assignment_virtual_machine_scale_sets" {
  description = <<EOT
Map of maintenance_assignment_virtual_machine_scale_sets, attributes below
Required:
    - location
    - maintenance_configuration_id
    - virtual_machine_scale_set_id
EOT

  type = map(object({
    location                     = string
    maintenance_configuration_id = string
    virtual_machine_scale_set_id = string
  }))
}
