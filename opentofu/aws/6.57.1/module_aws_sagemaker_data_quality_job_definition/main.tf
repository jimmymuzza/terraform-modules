resource "aws_sagemaker_data_quality_job_definition" "sagemaker_data_quality_job_definitions" {
  for_each = var.sagemaker_data_quality_job_definitions

  role_arn = each.value.role_arn
  name     = each.value.name
  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all

  dynamic "data_quality_app_specification" {
    for_each = each.value.data_quality_app_specification != null ? each.value.data_quality_app_specification : []
    content {
      image_uri                           = data_quality_app_specification.value.image_uri
      environment                         = data_quality_app_specification.value.environment
      post_analytics_processor_source_uri = data_quality_app_specification.value.post_analytics_processor_source_uri
      record_preprocessor_source_uri      = data_quality_app_specification.value.record_preprocessor_source_uri
    }
  }

  dynamic "data_quality_baseline_config" {
    for_each = each.value.data_quality_baseline_config != null ? each.value.data_quality_baseline_config : []
    content {

      dynamic "constraints_resource" {
        for_each = data_quality_baseline_config.value.constraints_resource != null ? data_quality_baseline_config.value.constraints_resource : []
        content {
          s3_uri = constraints_resource.value.s3_uri
        }
      }

      dynamic "statistics_resource" {
        for_each = data_quality_baseline_config.value.statistics_resource != null ? data_quality_baseline_config.value.statistics_resource : []
        content {
          s3_uri = statistics_resource.value.s3_uri
        }
      }
    }
  }

  dynamic "data_quality_job_input" {
    for_each = each.value.data_quality_job_input != null ? each.value.data_quality_job_input : []
    content {

      dynamic "batch_transform_input" {
        for_each = data_quality_job_input.value.batch_transform_input != null ? data_quality_job_input.value.batch_transform_input : []
        content {
          data_captured_destination_s3_uri = batch_transform_input.value.data_captured_destination_s3_uri
          local_path                       = batch_transform_input.value.local_path
          s3_data_distribution_type        = batch_transform_input.value.s3_data_distribution_type
          s3_input_mode                    = batch_transform_input.value.s3_input_mode

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
        for_each = data_quality_job_input.value.endpoint_input != null ? data_quality_job_input.value.endpoint_input : []
        content {
          endpoint_name             = endpoint_input.value.endpoint_name
          local_path                = endpoint_input.value.local_path
          s3_data_distribution_type = endpoint_input.value.s3_data_distribution_type
          s3_input_mode             = endpoint_input.value.s3_input_mode
        }
      }
    }
  }

  dynamic "data_quality_job_output_config" {
    for_each = each.value.data_quality_job_output_config != null ? each.value.data_quality_job_output_config : []
    content {
      kms_key_id = data_quality_job_output_config.value.kms_key_id

      dynamic "monitoring_outputs" {
        for_each = data_quality_job_output_config.value.monitoring_outputs != null ? data_quality_job_output_config.value.monitoring_outputs : []
        content {

          dynamic "s3_output" {
            for_each = monitoring_outputs.value.s3_output != null ? monitoring_outputs.value.s3_output : []
            content {
              s3_uri         = s3_output.value.s3_uri
              local_path     = s3_output.value.local_path
              s3_upload_mode = s3_output.value.s3_upload_mode
            }
          }
        }
      }
    }
  }

  dynamic "job_resources" {
    for_each = each.value.job_resources != null ? each.value.job_resources : []
    content {

      dynamic "cluster_config" {
        for_each = job_resources.value.cluster_config != null ? job_resources.value.cluster_config : []
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
    for_each = each.value.network_config != null ? each.value.network_config : []
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
    for_each = each.value.stopping_condition != null ? each.value.stopping_condition : []
    content {
      max_runtime_in_seconds = stopping_condition.value.max_runtime_in_seconds
    }
  }
}
