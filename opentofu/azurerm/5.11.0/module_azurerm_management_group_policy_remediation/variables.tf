variable "management_group_policy_remediations" {
  description = <<EOT
Map of management_group_policy_remediations, attributes below
Required:
    - management_group_id
    - name
    - policy_assignment_id
Optional:
    - failure_percentage
    - location_filters
    - parallel_deployments
    - policy_definition_reference_id
    - resource_count
EOT

  type = map(object({
    management_group_id            = string
    name                           = string
    policy_assignment_id           = string
    failure_percentage             = optional(number)
    location_filters               = optional(list(string))
    parallel_deployments           = optional(number)
    policy_definition_reference_id = optional(string)
    resource_count                 = optional(number)
  }))
}
