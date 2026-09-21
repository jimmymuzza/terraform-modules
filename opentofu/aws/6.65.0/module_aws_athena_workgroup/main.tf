resource "aws_athena_workgroup" "athena_workgroups" {
  for_each = var.athena_workgroups

  name          = each.value.name
  description   = each.value.description
  force_destroy = each.value.force_destroy
  region        = each.value.region
  state         = each.value.state
  tags          = each.value.tags
  tags_all      = each.value.tags_all

  dynamic "configuration" {
    for_each = each.value.configuration != null ? each.value.configuration : []
    content {
      bytes_scanned_cutoff_per_query          = configuration.value.bytes_scanned_cutoff_per_query
      enable_minimum_encryption_configuration = configuration.value.enable_minimum_encryption_configuration
      enforce_workgroup_configuration         = configuration.value.enforce_workgroup_configuration
      execution_role                          = configuration.value.execution_role
      publish_cloudwatch_metrics_enabled      = configuration.value.publish_cloudwatch_metrics_enabled
      requester_pays_enabled                  = configuration.value.requester_pays_enabled

      dynamic "customer_content_encryption_configuration" {
        for_each = configuration.value.customer_content_encryption_configuration != null ? configuration.value.customer_content_encryption_configuration : []
        content {
          kms_key = customer_content_encryption_configuration.value.kms_key
        }
      }

      dynamic "engine_version" {
        for_each = configuration.value.engine_version != null ? configuration.value.engine_version : []
        content {
          selected_engine_version = engine_version.value.selected_engine_version
        }
      }

      dynamic "identity_center_configuration" {
        for_each = configuration.value.identity_center_configuration != null ? configuration.value.identity_center_configuration : []
        content {
          enable_identity_center       = identity_center_configuration.value.enable_identity_center
          identity_center_instance_arn = identity_center_configuration.value.identity_center_instance_arn
        }
      }

      dynamic "managed_query_results_configuration" {
        for_each = configuration.value.managed_query_results_configuration != null ? configuration.value.managed_query_results_configuration : []
        content {
          enabled = managed_query_results_configuration.value.enabled

          dynamic "encryption_configuration" {
            for_each = managed_query_results_configuration.value.encryption_configuration != null ? managed_query_results_configuration.value.encryption_configuration : []
            content {
              kms_key = encryption_configuration.value.kms_key
            }
          }
        }
      }

      dynamic "monitoring_configuration" {
        for_each = configuration.value.monitoring_configuration != null ? configuration.value.monitoring_configuration : []
        content {

          dynamic "cloud_watch_logging_configuration" {
            for_each = monitoring_configuration.value.cloud_watch_logging_configuration != null ? monitoring_configuration.value.cloud_watch_logging_configuration : []
            content {
              enabled                = cloud_watch_logging_configuration.value.enabled
              log_group              = cloud_watch_logging_configuration.value.log_group
              log_stream_name_prefix = cloud_watch_logging_configuration.value.log_stream_name_prefix

              dynamic "log_type" {
                for_each = cloud_watch_logging_configuration.value.log_type != null ? cloud_watch_logging_configuration.value.log_type : []
                content {
                  key    = log_type.value.key
                  values = log_type.value.values
                }
              }
            }
          }

          dynamic "managed_logging_configuration" {
            for_each = monitoring_configuration.value.managed_logging_configuration != null ? monitoring_configuration.value.managed_logging_configuration : []
            content {
              enabled = managed_logging_configuration.value.enabled
              kms_key = managed_logging_configuration.value.kms_key
            }
          }

          dynamic "s3_logging_configuration" {
            for_each = monitoring_configuration.value.s3_logging_configuration != null ? monitoring_configuration.value.s3_logging_configuration : []
            content {
              enabled      = s3_logging_configuration.value.enabled
              kms_key      = s3_logging_configuration.value.kms_key
              log_location = s3_logging_configuration.value.log_location
            }
          }
        }
      }

      dynamic "query_results_s3_access_grants_configuration" {
        for_each = configuration.value.query_results_s3_access_grants_configuration != null ? configuration.value.query_results_s3_access_grants_configuration : []
        content {
          authentication_type      = query_results_s3_access_grants_configuration.value.authentication_type
          enable_s3_access_grants  = query_results_s3_access_grants_configuration.value.enable_s3_access_grants
          create_user_level_prefix = query_results_s3_access_grants_configuration.value.create_user_level_prefix
        }
      }

      dynamic "result_configuration" {
        for_each = configuration.value.result_configuration != null ? configuration.value.result_configuration : []
        content {
          expected_bucket_owner = result_configuration.value.expected_bucket_owner
          output_location       = result_configuration.value.output_location

          dynamic "acl_configuration" {
            for_each = result_configuration.value.acl_configuration != null ? result_configuration.value.acl_configuration : []
            content {
              s3_acl_option = acl_configuration.value.s3_acl_option
            }
          }

          dynamic "encryption_configuration" {
            for_each = result_configuration.value.encryption_configuration != null ? result_configuration.value.encryption_configuration : []
            content {
              encryption_option = encryption_configuration.value.encryption_option
              kms_key_arn       = encryption_configuration.value.kms_key_arn
            }
          }
        }
      }
    }
  }
}
