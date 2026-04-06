resource "aws_s3control_storage_lens_configuration" "s3control_storage_lens_configurations" {
  for_each = var.s3control_storage_lens_configurations

  config_id  = each.value.config_id
  account_id = each.value.account_id
  region     = each.value.region
  tags       = each.value.tags
  tags_all   = each.value.tags_all

  dynamic "storage_lens_configuration" {
    for_each = each.value.storage_lens_configuration != null ? each.value.storage_lens_configuration : []
    content {
      enabled = storage_lens_configuration.value.enabled

      dynamic "account_level" {
        for_each = storage_lens_configuration.value.account_level != null ? storage_lens_configuration.value.account_level : []
        content {

          dynamic "activity_metrics" {
            for_each = account_level.value.activity_metrics != null ? account_level.value.activity_metrics : []
            content {
              enabled = activity_metrics.value.enabled
            }
          }

          dynamic "advanced_cost_optimization_metrics" {
            for_each = account_level.value.advanced_cost_optimization_metrics != null ? account_level.value.advanced_cost_optimization_metrics : []
            content {
              enabled = advanced_cost_optimization_metrics.value.enabled
            }
          }

          dynamic "advanced_data_protection_metrics" {
            for_each = account_level.value.advanced_data_protection_metrics != null ? account_level.value.advanced_data_protection_metrics : []
            content {
              enabled = advanced_data_protection_metrics.value.enabled
            }
          }

          dynamic "advanced_performance_metrics" {
            for_each = account_level.value.advanced_performance_metrics != null ? account_level.value.advanced_performance_metrics : []
            content {
              enabled = advanced_performance_metrics.value.enabled
            }
          }

          dynamic "bucket_level" {
            for_each = account_level.value.bucket_level != null ? account_level.value.bucket_level : []
            content {

              dynamic "activity_metrics" {
                for_each = bucket_level.value.activity_metrics != null ? bucket_level.value.activity_metrics : []
                content {
                  enabled = activity_metrics.value.enabled
                }
              }

              dynamic "advanced_cost_optimization_metrics" {
                for_each = bucket_level.value.advanced_cost_optimization_metrics != null ? bucket_level.value.advanced_cost_optimization_metrics : []
                content {
                  enabled = advanced_cost_optimization_metrics.value.enabled
                }
              }

              dynamic "advanced_data_protection_metrics" {
                for_each = bucket_level.value.advanced_data_protection_metrics != null ? bucket_level.value.advanced_data_protection_metrics : []
                content {
                  enabled = advanced_data_protection_metrics.value.enabled
                }
              }

              dynamic "advanced_performance_metrics" {
                for_each = bucket_level.value.advanced_performance_metrics != null ? bucket_level.value.advanced_performance_metrics : []
                content {
                  enabled = advanced_performance_metrics.value.enabled
                }
              }

              dynamic "detailed_status_code_metrics" {
                for_each = bucket_level.value.detailed_status_code_metrics != null ? bucket_level.value.detailed_status_code_metrics : []
                content {
                  enabled = detailed_status_code_metrics.value.enabled
                }
              }

              dynamic "prefix_level" {
                for_each = bucket_level.value.prefix_level != null ? bucket_level.value.prefix_level : []
                content {

                  dynamic "storage_metrics" {
                    for_each = prefix_level.value.storage_metrics != null ? prefix_level.value.storage_metrics : []
                    content {
                      enabled = storage_metrics.value.enabled

                      dynamic "selection_criteria" {
                        for_each = storage_metrics.value.selection_criteria != null ? storage_metrics.value.selection_criteria : []
                        content {
                          delimiter                    = selection_criteria.value.delimiter
                          max_depth                    = selection_criteria.value.max_depth
                          min_storage_bytes_percentage = selection_criteria.value.min_storage_bytes_percentage
                        }
                      }
                    }
                  }
                }
              }
            }
          }

          dynamic "detailed_status_code_metrics" {
            for_each = account_level.value.detailed_status_code_metrics != null ? account_level.value.detailed_status_code_metrics : []
            content {
              enabled = detailed_status_code_metrics.value.enabled
            }
          }
        }
      }

      dynamic "aws_org" {
        for_each = storage_lens_configuration.value.aws_org != null ? storage_lens_configuration.value.aws_org : []
        content {
          arn = aws_org.value.arn
        }
      }

      dynamic "data_export" {
        for_each = storage_lens_configuration.value.data_export != null ? storage_lens_configuration.value.data_export : []
        content {

          dynamic "cloud_watch_metrics" {
            for_each = data_export.value.cloud_watch_metrics != null ? data_export.value.cloud_watch_metrics : []
            content {
              enabled = cloud_watch_metrics.value.enabled
            }
          }

          dynamic "s3_bucket_destination" {
            for_each = data_export.value.s3_bucket_destination != null ? data_export.value.s3_bucket_destination : []
            content {
              account_id            = s3_bucket_destination.value.account_id
              arn                   = s3_bucket_destination.value.arn
              format                = s3_bucket_destination.value.format
              output_schema_version = s3_bucket_destination.value.output_schema_version
              prefix                = s3_bucket_destination.value.prefix

              dynamic "encryption" {
                for_each = s3_bucket_destination.value.encryption != null ? s3_bucket_destination.value.encryption : []
                content {

                  dynamic "sse_kms" {
                    for_each = encryption.value.sse_kms != null ? encryption.value.sse_kms : []
                    content {
                      key_id = sse_kms.value.key_id
                    }
                  }

                  dynamic "sse_s3" {
                    for_each = encryption.value.sse_s3 != null ? encryption.value.sse_s3 : []
                    content {
                    }
                  }
                }
              }
            }
          }
        }
      }

      dynamic "exclude" {
        for_each = storage_lens_configuration.value.exclude != null ? storage_lens_configuration.value.exclude : []
        content {
          buckets = exclude.value.buckets
          regions = exclude.value.regions
        }
      }

      dynamic "include" {
        for_each = storage_lens_configuration.value.include != null ? storage_lens_configuration.value.include : []
        content {
          buckets = include.value.buckets
          regions = include.value.regions
        }
      }
    }
  }
}
