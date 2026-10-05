variable "synapse_integration_runtime_azures" {
  description = <<EOT
Map of synapse_integration_runtime_azures, attributes below
Required:
    - location
    - name
    - synapse_workspace_id
Optional:
    - compute_type
    - core_count
    - description
    - time_to_live_min
EOT

  type = map(object({
    location             = string
    name                 = string
    synapse_workspace_id = string
    compute_type         = optional(string)
    core_count           = optional(number)
    description          = optional(string)
    time_to_live_min     = optional(number)
  }))
}
