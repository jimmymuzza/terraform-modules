variable "maintenance_assignment_dedicated_hosts" {
  description = <<EOT
Map of maintenance_assignment_dedicated_hosts, attributes below
Required:
    - dedicated_host_id
    - location
    - maintenance_configuration_id
EOT

  type = map(object({
    dedicated_host_id            = string
    location                     = string
    maintenance_configuration_id = string
  }))
}
