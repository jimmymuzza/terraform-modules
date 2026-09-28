resource "aws_autoscaling_policy" "autoscaling_policies" {
  for_each = var.autoscaling_policies

  autoscaling_group_name    = each.value.autoscaling_group_name
  name                      = each.value.name
  adjustment_type           = each.value.adjustment_type
  cooldown                  = each.value.cooldown
  enabled                   = each.value.enabled
  estimated_instance_warmup = each.value.estimated_instance_warmup
  metric_aggregation_type   = each.value.metric_aggregation_type
  min_adjustment_magnitude  = each.value.min_adjustment_magnitude
  policy_type               = each.value.policy_type
  region                    = each.value.region
  scaling_adjustment        = each.value.scaling_adjustment

  dynamic "predictive_scaling_configuration" {
    for_each = each.value.predictive_scaling_configuration != null ? each.value.predictive_scaling_configuration : []
    content {
      max_capacity_breach_behavior = predictive_scaling_configuration.value.max_capacity_breach_behavior
      max_capacity_buffer          = predictive_scaling_configuration.value.max_capacity_buffer
      mode                         = predictive_scaling_configuration.value.mode
      scheduling_buffer_time       = predictive_scaling_configuration.value.scheduling_buffer_time

      dynamic "metric_specification" {
        for_each = predictive_scaling_configuration.value.metric_specification != null ? predictive_scaling_configuration.value.metric_specification : []
        content {
          target_value = metric_specification.value.target_value

          dynamic "customized_capacity_metric_specification" {
            for_each = metric_specification.value.customized_capacity_metric_specification != null ? metric_specification.value.customized_capacity_metric_specification : []
            content {

              dynamic "metric_data_queries" {
                for_each = customized_capacity_metric_specification.value.metric_data_queries != null ? customized_capacity_metric_specification.value.metric_data_queries : []
                content {
                  expression  = metric_data_queries.value.expression
                  label       = metric_data_queries.value.label
                  return_data = metric_data_queries.value.return_data

                  dynamic "metric_stat" {
                    for_each = metric_data_queries.value.metric_stat != null ? metric_data_queries.value.metric_stat : []
                    content {
                      stat = metric_stat.value.stat
                      unit = metric_stat.value.unit

                      dynamic "metric" {
                        for_each = metric_stat.value.metric != null ? metric_stat.value.metric : []
                        content {
                          metric_name = metric.value.metric_name
                          namespace   = metric.value.namespace

                          dynamic "dimensions" {
                            for_each = metric.value.dimensions != null ? metric.value.dimensions : []
                            content {
                              name  = dimensions.value.name
                              value = dimensions.value.value
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }

          dynamic "customized_load_metric_specification" {
            for_each = metric_specification.value.customized_load_metric_specification != null ? metric_specification.value.customized_load_metric_specification : []
            content {

              dynamic "metric_data_queries" {
                for_each = customized_load_metric_specification.value.metric_data_queries != null ? customized_load_metric_specification.value.metric_data_queries : []
                content {
                  expression  = metric_data_queries.value.expression
                  label       = metric_data_queries.value.label
                  return_data = metric_data_queries.value.return_data

                  dynamic "metric_stat" {
                    for_each = metric_data_queries.value.metric_stat != null ? metric_data_queries.value.metric_stat : []
                    content {
                      stat = metric_stat.value.stat
                      unit = metric_stat.value.unit

                      dynamic "metric" {
                        for_each = metric_stat.value.metric != null ? metric_stat.value.metric : []
                        content {
                          metric_name = metric.value.metric_name
                          namespace   = metric.value.namespace

                          dynamic "dimensions" {
                            for_each = metric.value.dimensions != null ? metric.value.dimensions : []
                            content {
                              name  = dimensions.value.name
                              value = dimensions.value.value
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }

          dynamic "customized_scaling_metric_specification" {
            for_each = metric_specification.value.customized_scaling_metric_specification != null ? metric_specification.value.customized_scaling_metric_specification : []
            content {

              dynamic "metric_data_queries" {
                for_each = customized_scaling_metric_specification.value.metric_data_queries != null ? customized_scaling_metric_specification.value.metric_data_queries : []
                content {
                  expression  = metric_data_queries.value.expression
                  label       = metric_data_queries.value.label
                  return_data = metric_data_queries.value.return_data

                  dynamic "metric_stat" {
                    for_each = metric_data_queries.value.metric_stat != null ? metric_data_queries.value.metric_stat : []
                    content {
                      stat = metric_stat.value.stat
                      unit = metric_stat.value.unit

                      dynamic "metric" {
                        for_each = metric_stat.value.metric != null ? metric_stat.value.metric : []
                        content {
                          metric_name = metric.value.metric_name
                          namespace   = metric.value.namespace

                          dynamic "dimensions" {
                            for_each = metric.value.dimensions != null ? metric.value.dimensions : []
                            content {
                              name  = dimensions.value.name
                              value = dimensions.value.value
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }

          dynamic "predefined_load_metric_specification" {
            for_each = metric_specification.value.predefined_load_metric_specification != null ? metric_specification.value.predefined_load_metric_specification : []
            content {
              predefined_metric_type = predefined_load_metric_specification.value.predefined_metric_type
              resource_label         = predefined_load_metric_specification.value.resource_label
            }
          }

          dynamic "predefined_metric_pair_specification" {
            for_each = metric_specification.value.predefined_metric_pair_specification != null ? metric_specification.value.predefined_metric_pair_specification : []
            content {
              predefined_metric_type = predefined_metric_pair_specification.value.predefined_metric_type
              resource_label         = predefined_metric_pair_specification.value.resource_label
            }
          }

          dynamic "predefined_scaling_metric_specification" {
            for_each = metric_specification.value.predefined_scaling_metric_specification != null ? metric_specification.value.predefined_scaling_metric_specification : []
            content {
              predefined_metric_type = predefined_scaling_metric_specification.value.predefined_metric_type
              resource_label         = predefined_scaling_metric_specification.value.resource_label
            }
          }
        }
      }
    }
  }

  dynamic "step_adjustment" {
    for_each = each.value.step_adjustment != null ? each.value.step_adjustment : []
    content {
      scaling_adjustment          = step_adjustment.value.scaling_adjustment
      metric_interval_lower_bound = step_adjustment.value.metric_interval_lower_bound
      metric_interval_upper_bound = step_adjustment.value.metric_interval_upper_bound
    }
  }

  dynamic "target_tracking_configuration" {
    for_each = each.value.target_tracking_configuration != null ? each.value.target_tracking_configuration : []
    content {
      target_value     = target_tracking_configuration.value.target_value
      disable_scale_in = target_tracking_configuration.value.disable_scale_in

      dynamic "customized_metric_specification" {
        for_each = target_tracking_configuration.value.customized_metric_specification != null ? target_tracking_configuration.value.customized_metric_specification : []
        content {
          metric_name = customized_metric_specification.value.metric_name
          namespace   = customized_metric_specification.value.namespace
          period      = customized_metric_specification.value.period
          statistic   = customized_metric_specification.value.statistic
          unit        = customized_metric_specification.value.unit

          dynamic "metric_dimension" {
            for_each = customized_metric_specification.value.metric_dimension != null ? customized_metric_specification.value.metric_dimension : []
            content {
              name  = metric_dimension.value.name
              value = metric_dimension.value.value
            }
          }

          dynamic "metrics" {
            for_each = customized_metric_specification.value.metrics != null ? customized_metric_specification.value.metrics : []
            content {
              expression  = metrics.value.expression
              label       = metrics.value.label
              return_data = metrics.value.return_data

              dynamic "metric_stat" {
                for_each = metrics.value.metric_stat != null ? metrics.value.metric_stat : []
                content {
                  stat   = metric_stat.value.stat
                  period = metric_stat.value.period
                  unit   = metric_stat.value.unit

                  dynamic "metric" {
                    for_each = metric_stat.value.metric != null ? metric_stat.value.metric : []
                    content {
                      metric_name = metric.value.metric_name
                      namespace   = metric.value.namespace

                      dynamic "dimensions" {
                        for_each = metric.value.dimensions != null ? metric.value.dimensions : []
                        content {
                          name  = dimensions.value.name
                          value = dimensions.value.value
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }

      dynamic "predefined_metric_specification" {
        for_each = target_tracking_configuration.value.predefined_metric_specification != null ? target_tracking_configuration.value.predefined_metric_specification : []
        content {
          predefined_metric_type = predefined_metric_specification.value.predefined_metric_type
          resource_label         = predefined_metric_specification.value.resource_label
        }
      }
    }
  }
}
