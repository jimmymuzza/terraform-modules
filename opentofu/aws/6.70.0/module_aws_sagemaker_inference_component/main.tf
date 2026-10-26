resource "aws_sagemaker_inference_component" "sagemaker_inference_components" {
  for_each = var.sagemaker_inference_components

  endpoint_name = each.value.endpoint_name
  name          = each.value.name
  region        = each.value.region
  tags          = each.value.tags
  variant_name  = each.value.variant_name

  dynamic "deployment_config" {
    for_each = each.value.deployment_config != null ? each.value.deployment_config : []
    content {

      dynamic "auto_rollback_configuration" {
        for_each = deployment_config.value.auto_rollback_configuration != null ? deployment_config.value.auto_rollback_configuration : []
        content {

          dynamic "alarms" {
            for_each = auto_rollback_configuration.value.alarms != null ? auto_rollback_configuration.value.alarms : []
            content {
              alarm_name = alarms.value.alarm_name
            }
          }
        }
      }

      dynamic "rolling_update_policy" {
        for_each = deployment_config.value.rolling_update_policy != null ? deployment_config.value.rolling_update_policy : []
        content {
          wait_interval_in_seconds             = rolling_update_policy.value.wait_interval_in_seconds
          maximum_execution_timeout_in_seconds = rolling_update_policy.value.maximum_execution_timeout_in_seconds

          dynamic "maximum_batch_size" {
            for_each = rolling_update_policy.value.maximum_batch_size != null ? rolling_update_policy.value.maximum_batch_size : []
            content {
              type  = maximum_batch_size.value.type
              value = maximum_batch_size.value.value
            }
          }

          dynamic "rollback_maximum_batch_size" {
            for_each = rolling_update_policy.value.rollback_maximum_batch_size != null ? rolling_update_policy.value.rollback_maximum_batch_size : []
            content {
              type  = rollback_maximum_batch_size.value.type
              value = rollback_maximum_batch_size.value.value
            }
          }
        }
      }
    }
  }

  dynamic "runtime_config" {
    for_each = each.value.runtime_config != null ? each.value.runtime_config : []
    content {
      copy_count = runtime_config.value.copy_count
    }
  }

  dynamic "specification" {
    for_each = each.value.specification != null ? each.value.specification : []
    content {
      base_inference_component_name = specification.value.base_inference_component_name
      instance_type                 = specification.value.instance_type
      model_name                    = specification.value.model_name

      dynamic "compute_resource_requirements" {
        for_each = specification.value.compute_resource_requirements != null ? specification.value.compute_resource_requirements : []
        content {
          min_memory_required_in_mb              = compute_resource_requirements.value.min_memory_required_in_mb
          max_memory_required_in_mb              = compute_resource_requirements.value.max_memory_required_in_mb
          number_of_accelerator_devices_required = compute_resource_requirements.value.number_of_accelerator_devices_required
          number_of_cpu_cores_required           = compute_resource_requirements.value.number_of_cpu_cores_required
        }
      }

      dynamic "container" {
        for_each = specification.value.container != null ? specification.value.container : []
        content {
          artifact_url = container.value.artifact_url
          environment  = container.value.environment
          image        = container.value.image

          dynamic "container_metrics_config" {
            for_each = container.value.container_metrics_config != null ? container.value.container_metrics_config : []
            content {

              dynamic "metrics_endpoint" {
                for_each = container_metrics_config.value.metrics_endpoint != null ? container_metrics_config.value.metrics_endpoint : []
                content {
                  metrics_endpoint_path               = metrics_endpoint.value.metrics_endpoint_path
                  metric_publish_frequency_in_seconds = metrics_endpoint.value.metric_publish_frequency_in_seconds
                }
              }
            }
          }
        }
      }

      dynamic "data_cache_config" {
        for_each = specification.value.data_cache_config != null ? specification.value.data_cache_config : []
        content {
          enable_caching = data_cache_config.value.enable_caching
        }
      }

      dynamic "scheduling_config" {
        for_each = specification.value.scheduling_config != null ? specification.value.scheduling_config : []
        content {
          placement_strategy = scheduling_config.value.placement_strategy

          dynamic "availability_zone_balance" {
            for_each = scheduling_config.value.availability_zone_balance != null ? scheduling_config.value.availability_zone_balance : []
            content {
              enforcement_mode = availability_zone_balance.value.enforcement_mode
              max_imbalance    = availability_zone_balance.value.max_imbalance
            }
          }
        }
      }

      dynamic "startup_parameters" {
        for_each = specification.value.startup_parameters != null ? specification.value.startup_parameters : []
        content {
          container_startup_health_check_timeout_in_seconds = startup_parameters.value.container_startup_health_check_timeout_in_seconds
          model_data_download_timeout_in_seconds            = startup_parameters.value.model_data_download_timeout_in_seconds
        }
      }
    }
  }

  dynamic "specifications" {
    for_each = each.value.specifications != null ? each.value.specifications : []
    content {
      base_inference_component_name = specifications.value.base_inference_component_name
      instance_type                 = specifications.value.instance_type
      model_name                    = specifications.value.model_name

      dynamic "compute_resource_requirements" {
        for_each = specifications.value.compute_resource_requirements != null ? specifications.value.compute_resource_requirements : []
        content {
          min_memory_required_in_mb              = compute_resource_requirements.value.min_memory_required_in_mb
          max_memory_required_in_mb              = compute_resource_requirements.value.max_memory_required_in_mb
          number_of_accelerator_devices_required = compute_resource_requirements.value.number_of_accelerator_devices_required
          number_of_cpu_cores_required           = compute_resource_requirements.value.number_of_cpu_cores_required
        }
      }

      dynamic "container" {
        for_each = specifications.value.container != null ? specifications.value.container : []
        content {
          artifact_url = container.value.artifact_url
          environment  = container.value.environment
          image        = container.value.image

          dynamic "container_metrics_config" {
            for_each = container.value.container_metrics_config != null ? container.value.container_metrics_config : []
            content {

              dynamic "metrics_endpoint" {
                for_each = container_metrics_config.value.metrics_endpoint != null ? container_metrics_config.value.metrics_endpoint : []
                content {
                  metrics_endpoint_path               = metrics_endpoint.value.metrics_endpoint_path
                  metric_publish_frequency_in_seconds = metrics_endpoint.value.metric_publish_frequency_in_seconds
                }
              }
            }
          }
        }
      }

      dynamic "data_cache_config" {
        for_each = specifications.value.data_cache_config != null ? specifications.value.data_cache_config : []
        content {
          enable_caching = data_cache_config.value.enable_caching
        }
      }

      dynamic "scheduling_config" {
        for_each = specifications.value.scheduling_config != null ? specifications.value.scheduling_config : []
        content {
          placement_strategy = scheduling_config.value.placement_strategy

          dynamic "availability_zone_balance" {
            for_each = scheduling_config.value.availability_zone_balance != null ? scheduling_config.value.availability_zone_balance : []
            content {
              enforcement_mode = availability_zone_balance.value.enforcement_mode
              max_imbalance    = availability_zone_balance.value.max_imbalance
            }
          }
        }
      }

      dynamic "startup_parameters" {
        for_each = specifications.value.startup_parameters != null ? specifications.value.startup_parameters : []
        content {
          container_startup_health_check_timeout_in_seconds = startup_parameters.value.container_startup_health_check_timeout_in_seconds
          model_data_download_timeout_in_seconds            = startup_parameters.value.model_data_download_timeout_in_seconds
        }
      }
    }
  }
}
