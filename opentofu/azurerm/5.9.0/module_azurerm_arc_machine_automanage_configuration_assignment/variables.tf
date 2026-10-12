variable "arc_machine_automanage_configuration_assignments" {
  description = <<EOT
Map of arc_machine_automanage_configuration_assignments, attributes below
Required:
    - arc_machine_id
    - configuration_id
EOT

  type = map(object({
    arc_machine_id   = string
    configuration_id = string
  }))
}
