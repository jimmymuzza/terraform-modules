variable "appautoscaling_policies" {
  description = <<EOT
Map of appautoscaling_policies, attributes below
Required:
    - name
    - resource_id
    - scalable_dimension
    - service_namespace
Optional:
    - policy_type
    - region
    - predictive_scaling_policy_configuration
    - step_scaling_policy_configuration
    - target_tracking_scaling_policy_configuration
EOT

  type = map(object({
    name                                         = string
    resource_id                                  = string
    scalable_dimension                           = string
    service_namespace                            = string
    policy_type                                  = optional(string)
    region                                       = optional(string)
    predictive_scaling_policy_configuration      = optional(list(object({
            max_capacity_breach_behavior = optional(string)
            max_capacity_buffer          = optional(number)
            mode                         = optional(string)
            scheduling_buffer_time       = optional(number)
            metric_specification         = list(object({
                target_value                             = string
                customized_capacity_metric_specification = optional(list(object({
                    metric_data_query = list(object({
                        expression  = optional(string)
                        label       = optional(string)
                        return_data = optional(bool)
                        metric_stat = optional(list(object({
                            stat   = string
                            unit   = optional(string)
                            metric = list(object({
                                metric_name = optional(string)
                                namespace   = optional(string)
                                dimension   = optional(set(object({
                                    name  = string
                                    value = string
                                })))
                            }))
                        })))
                    }))
                })))
                customized_load_metric_specification     = optional(list(object({
                    metric_data_query = list(object({
                        expression  = optional(string)
                        label       = optional(string)
                        return_data = optional(bool)
                        metric_stat = optional(list(object({
                            stat   = string
                            unit   = optional(string)
                            metric = list(object({
                                metric_name = optional(string)
                                namespace   = optional(string)
                                dimension   = optional(set(object({
                                    name  = string
                                    value = string
                                })))
                            }))
                        })))
                    }))
                })))
                customized_scaling_metric_specification  = optional(list(object({
                    metric_data_query = list(object({
                        expression  = optional(string)
                        label       = optional(string)
                        return_data = optional(bool)
                        metric_stat = optional(list(object({
                            stat   = string
                            unit   = optional(string)
                            metric = list(object({
                                metric_name = optional(string)
                                namespace   = optional(string)
                                dimension   = optional(set(object({
                                    name  = string
                                    value = string
                                })))
                            }))
                        })))
                    }))
                })))
                predefined_load_metric_specification     = optional(list(object({
                    predefined_metric_type = string
                    resource_label         = optional(string)
                })))
                predefined_metric_pair_specification     = optional(list(object({
                    predefined_metric_type = string
                    resource_label         = optional(string)
                })))
                predefined_scaling_metric_specification  = optional(list(object({
                    predefined_metric_type = string
                    resource_label         = optional(string)
                })))
            }))
        })))
    step_scaling_policy_configuration            = optional(list(object({
            adjustment_type          = optional(string)
            cooldown                 = optional(number)
            metric_aggregation_type  = optional(string)
            min_adjustment_magnitude = optional(number)
            step_adjustment          = optional(set(object({
                scaling_adjustment          = number
                metric_interval_lower_bound = optional(string)
                metric_interval_upper_bound = optional(string)
            })))
        })))
    target_tracking_scaling_policy_configuration = optional(list(object({
            target_value                    = number
            disable_scale_in                = optional(bool)
            scale_in_cooldown               = optional(number)
            scale_out_cooldown              = optional(number)
            customized_metric_specification = optional(list(object({
                metric_name = optional(string)
                namespace   = optional(string)
                statistic   = optional(string)
                unit        = optional(string)
                dimensions  = optional(set(object({
                    name  = string
                    value = string
                })))
                metrics     = optional(set(object({
                    expression  = optional(string)
                    label       = optional(string)
                    return_data = optional(bool)
                    metric_stat = optional(list(object({
                        stat   = string
                        unit   = optional(string)
                        metric = list(object({
                            metric_name = string
                            namespace   = string
                            dimensions  = optional(set(object({
                                name  = string
                                value = string
                            })))
                        }))
                    })))
                })))
            })))
            predefined_metric_specification = optional(list(object({
                predefined_metric_type = string
                resource_label         = optional(string)
            })))
        })))
  }))
}
