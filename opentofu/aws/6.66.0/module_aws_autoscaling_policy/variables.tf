variable "autoscaling_policies" {
  description = <<EOT
Map of autoscaling_policies, attributes below
Required:
    - autoscaling_group_name
    - name
Optional:
    - adjustment_type
    - cooldown
    - enabled
    - estimated_instance_warmup
    - metric_aggregation_type
    - min_adjustment_magnitude
    - policy_type
    - region
    - scaling_adjustment
    - predictive_scaling_configuration
    - step_adjustment
    - target_tracking_configuration
EOT

  type = map(object({
    autoscaling_group_name           = string
    name                             = string
    adjustment_type                  = optional(string)
    cooldown                         = optional(number)
    enabled                          = optional(bool)
    estimated_instance_warmup        = optional(number)
    metric_aggregation_type          = optional(string)
    min_adjustment_magnitude         = optional(number)
    policy_type                      = optional(string)
    region                           = optional(string)
    scaling_adjustment               = optional(number)
    predictive_scaling_configuration = optional(list(object({
            max_capacity_breach_behavior = optional(string)
            max_capacity_buffer          = optional(string)
            mode                         = optional(string)
            scheduling_buffer_time       = optional(string)
            metric_specification         = list(object({
                target_value                             = number
                customized_capacity_metric_specification = optional(list(object({
                    metric_data_queries = list(object({
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
                    }))
                })))
                customized_load_metric_specification     = optional(list(object({
                    metric_data_queries = list(object({
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
                    }))
                })))
                customized_scaling_metric_specification  = optional(list(object({
                    metric_data_queries = list(object({
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
    step_adjustment                  = optional(set(object({
            scaling_adjustment          = number
            metric_interval_lower_bound = optional(string)
            metric_interval_upper_bound = optional(string)
        })))
    target_tracking_configuration    = optional(list(object({
            target_value                    = number
            disable_scale_in                = optional(bool)
            customized_metric_specification = optional(list(object({
                metric_name      = optional(string)
                namespace        = optional(string)
                period           = optional(number)
                statistic        = optional(string)
                unit             = optional(string)
                metric_dimension = optional(list(object({
                    name  = string
                    value = string
                })))
                metrics          = optional(set(object({
                    expression  = optional(string)
                    label       = optional(string)
                    return_data = optional(bool)
                    metric_stat = optional(list(object({
                        stat   = string
                        period = optional(number)
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
