variable "resource_group_policy_remediations" {
  description = <<EOT
Map of resource_group_policy_remediations, attributes below
Required:
    - name
    - policy_assignment_id
    - resource_group_id
Optional:
    - failure_percentage
    - location_filters
    - parallel_deployments
    - policy_definition_reference_id
    - resource_count
    - resource_discovery_mode
EOT

  type = map(object({
    name                           = string
    policy_assignment_id           = string
    resource_group_id              = string
    failure_percentage             = optional(number)
    location_filters               = optional(list(string))
    parallel_deployments           = optional(number)
    policy_definition_reference_id = optional(string)
    resource_count                 = optional(number)
    resource_discovery_mode        = optional(string)
  }))
}
