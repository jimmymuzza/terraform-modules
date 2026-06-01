variable "network_manager_deployments" {
  description = <<EOT
Map of network_manager_deployments, attributes below
Required:
    - configuration_ids
    - location
    - network_manager_id
    - scope_access
Optional:
    - triggers
EOT

  type = map(object({
    configuration_ids  = list(string)
    location           = string
    network_manager_id = string
    scope_access       = string
    triggers           = optional(map(string))
  }))
}
