variable "computeoptimizer_recommendation_preferences" {
  description = <<EOT
Map of computeoptimizer_recommendation_preferences, attributes below
Required:
    - resource_type
Optional:
    - enhanced_infrastructure_metrics
    - inferred_workload_types
    - look_back_period
    - region
    - savings_estimation_mode
    - external_metrics_preference
    - preferred_resource
    - scope
    - utilization_preference
EOT

  type = map(object({
    resource_type                   = string
    enhanced_infrastructure_metrics = optional(string)
    inferred_workload_types         = optional(string)
    look_back_period                = optional(string)
    region                          = optional(string)
    savings_estimation_mode         = optional(string)
    external_metrics_preference     = optional(list(object({
            source = string
        })))
    preferred_resource              = optional(list(object({
            name         = string
            exclude_list = optional(set(string))
            include_list = optional(set(string))
        })))
    scope                           = optional(list(object({
            name  = string
            value = string
        })))
    utilization_preference          = optional(list(object({
            metric_name       = string
            metric_parameters = optional(list(object({
                headroom  = string
                threshold = optional(string)
            })))
        })))
  }))
}
