variable "virtual_machine_automanage_configuration_assignments" {
  description = <<EOT
Map of virtual_machine_automanage_configuration_assignments, attributes below
Required:
    - configuration_id
    - virtual_machine_id
EOT

  type = map(object({
    configuration_id   = string
    virtual_machine_id = string
  }))
}
