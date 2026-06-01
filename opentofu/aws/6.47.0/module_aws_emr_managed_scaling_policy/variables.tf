variable "emr_managed_scaling_policies" {
  description = <<EOT
Map of emr_managed_scaling_policies, attributes below
Required:
    - cluster_id
    - compute_limits
Optional:
    - region
    - scaling_strategy
    - utilization_performance_index
EOT

  type = map(object({
    cluster_id                    = string
    region                        = optional(string)
    scaling_strategy              = optional(string)
    utilization_performance_index = optional(number)
    compute_limits                = set(object({
            maximum_capacity_units          = number
            minimum_capacity_units          = number
            unit_type                       = string
            maximum_core_capacity_units     = optional(number)
            maximum_ondemand_capacity_units = optional(number)
        }))
  }))
}
