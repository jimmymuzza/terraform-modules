variable "maintenance_assignment_virtual_machines" {
  description = <<EOT
Map of maintenance_assignment_virtual_machines, attributes below
Required:
    - location
    - maintenance_configuration_id
    - virtual_machine_id
EOT

  type = map(object({
    location                     = string
    maintenance_configuration_id = string
    virtual_machine_id           = string
  }))
}
