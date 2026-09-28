resource "aws_sagemaker_monitoring_schedule" "sagemaker_monitoring_schedules" {
  for_each = var.sagemaker_monitoring_schedules

  name     = each.value.name
  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all

  dynamic "monitoring_schedule_config" {
    for_each = each.value.monitoring_schedule_config != null ? each.value.monitoring_schedule_config : []
    content {
      monitoring_type                = monitoring_schedule_config.value.monitoring_type
      monitoring_job_definition_name = monitoring_schedule_config.value.monitoring_job_definition_name

      dynamic "monitoring_job_definition" {
        for_each = monitoring_schedule_config.value.monitoring_job_definition != null ? monitoring_schedule_config.value.monitoring_job_definition : []
        content {
          role_arn    = monitoring_job_definition.value.role_arn
          environment = monitoring_job_definition.value.environment

          dynamic "baseline" {
            for_each = monitoring_job_definition.value.baseline != null ? monitoring_job_definition.value.baseline : []
            content {
              baselining_job_name = baseline.value.baselining_job_name

              dynamic "constraints_resource" {
                for_each = baseline.value.constraints_resource != null ? baseline.value.constraints_resource : []
                content {
                  s3_uri = constraints_resource.value.s3_uri
                }
              }

              dynamic "statistics_resource" {
                for_each = baseline.value.statistics_resource != null ? baseline.value.statistics_resource : []
                content {
                  s3_uri = statistics_resource.value.s3_uri
                }
              }
            }
          }

          dynamic "monitoring_app_specification" {
            for_each = monitoring_job_definition.value.monitoring_app_specification != null ? monitoring_job_definition.value.monitoring_app_specification : []
            content {
              image_uri                           = monitoring_app_specification.value.image_uri
              container_arguments                 = monitoring_app_specification.value.container_arguments
              container_entrypoint                = monitoring_app_specification.value.container_entrypoint
              post_analytics_processor_source_uri = monitoring_app_specification.value.post_analytics_processor_source_uri
              record_preprocessor_source_uri      = monitoring_app_specification.value.record_preprocessor_source_uri
            }
          }

          dynamic "monitoring_inputs" {
            for_each = monitoring_job_definition.value.monitoring_inputs != null ? monitoring_job_definition.value.monitoring_inputs : []
            content {

              dynamic "batch_transform_input" {
                for_each = monitoring_inputs.value.batch_transform_input != null ? monitoring_inputs.value.batch_transform_input : []
                content {
                  data_captured_destination_s3_uri = batch_transform_input.value.data_captured_destination_s3_uri
                  local_path                       = batch_transform_input.value.local_path
                  end_time_offset                  = batch_transform_input.value.end_time_offset
                  exclude_features_attribute       = batch_transform_input.value.exclude_features_attribute
                  features_attribute               = batch_transform_input.value.features_attribute
                  inference_attribute              = batch_transform_input.value.inference_attribute
                  probability_attribute            = batch_transform_input.value.probability_attribute
                  probability_threshold_attribute  = batch_transform_input.value.probability_threshold_attribute
                  s3_data_distribution_type        = batch_transform_input.value.s3_data_distribution_type
                  s3_input_mode                    = batch_transform_input.value.s3_input_mode
                  start_time_offset                = batch_transform_input.value.start_time_offset

                  dynamic "dataset_format" {
                    for_each = batch_transform_input.value.dataset_format != null ? batch_transform_input.value.dataset_format : []
                    content {

                      dynamic "csv" {
                        for_each = dataset_format.value.csv != null ? dataset_format.value.csv : []
                        content {
                          header = csv.value.header
                        }
                      }

                      dynamic "json" {
                        for_each = dataset_format.value.json != null ? dataset_format.value.json : []
                        content {
                          line = json.value.line
                        }
                      }
                    }
                  }
                }
              }

              dynamic "endpoint_input" {
                for_each = monitoring_inputs.value.endpoint_input != null ? monitoring_inputs.value.endpoint_input : []
                content {
                  endpoint_name                   = endpoint_input.value.endpoint_name
                  local_path                      = endpoint_input.value.local_path
                  end_time_offset                 = endpoint_input.value.end_time_offset
                  exclude_features_attribute      = endpoint_input.value.exclude_features_attribute
                  features_attribute              = endpoint_input.value.features_attribute
                  inference_attribute             = endpoint_input.value.inference_attribute
                  probability_attribute           = endpoint_input.value.probability_attribute
                  probability_threshold_attribute = endpoint_input.value.probability_threshold_attribute
                  s3_data_distribution_type       = endpoint_input.value.s3_data_distribution_type
                  s3_input_mode                   = endpoint_input.value.s3_input_mode
                  start_time_offset               = endpoint_input.value.start_time_offset
                }
              }
            }
          }

          dynamic "monitoring_output_config" {
            for_each = monitoring_job_definition.value.monitoring_output_config != null ? monitoring_job_definition.value.monitoring_output_config : []
            content {
              kms_key_id = monitoring_output_config.value.kms_key_id

              dynamic "monitoring_outputs" {
                for_each = monitoring_output_config.value.monitoring_outputs != null ? monitoring_output_config.value.monitoring_outputs : []
                content {

                  dynamic "s3_output" {
                    for_each = monitoring_outputs.value.s3_output != null ? monitoring_outputs.value.s3_output : []
                    content {
                      local_path     = s3_output.value.local_path
                      s3_uri         = s3_output.value.s3_uri
                      s3_upload_mode = s3_output.value.s3_upload_mode
                    }
                  }
                }
              }
            }
          }

          dynamic "monitoring_resources" {
            for_each = monitoring_job_definition.value.monitoring_resources != null ? monitoring_job_definition.value.monitoring_resources : []
            content {

              dynamic "cluster_config" {
                for_each = monitoring_resources.value.cluster_config != null ? monitoring_resources.value.cluster_config : []
                content {
                  instance_count    = cluster_config.value.instance_count
                  instance_type     = cluster_config.value.instance_type
                  volume_size_in_gb = cluster_config.value.volume_size_in_gb
                  volume_kms_key_id = cluster_config.value.volume_kms_key_id
                }
              }
            }
          }

          dynamic "network_config" {
            for_each = monitoring_job_definition.value.network_config != null ? monitoring_job_definition.value.network_config : []
            content {
              enable_inter_container_traffic_encryption = network_config.value.enable_inter_container_traffic_encryption
              enable_network_isolation                  = network_config.value.enable_network_isolation

              dynamic "vpc_config" {
                for_each = network_config.value.vpc_config != null ? network_config.value.vpc_config : []
                content {
                  security_group_ids = vpc_config.value.security_group_ids
                  subnets            = vpc_config.value.subnets
                }
              }
            }
          }

          dynamic "stopping_condition" {
            for_each = monitoring_job_definition.value.stopping_condition != null ? monitoring_job_definition.value.stopping_condition : []
            content {
              max_runtime_in_seconds = stopping_condition.value.max_runtime_in_seconds
            }
          }
        }
      }

      dynamic "schedule_config" {
        for_each = monitoring_schedule_config.value.schedule_config != null ? monitoring_schedule_config.value.schedule_config : []
        content {
          schedule_expression = schedule_config.value.schedule_expression
        }
      }
    }
  }
}
