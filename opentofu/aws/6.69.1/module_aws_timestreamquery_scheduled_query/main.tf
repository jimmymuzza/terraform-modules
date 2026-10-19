resource "aws_timestreamquery_scheduled_query" "timestreamquery_scheduled_queries" {
  for_each = var.timestreamquery_scheduled_queries

  execution_role_arn = each.value.execution_role_arn
  name               = each.value.name
  query_string       = each.value.query_string
  kms_key_id         = each.value.kms_key_id
  region             = each.value.region
  tags               = each.value.tags

  dynamic "error_report_configuration" {
    for_each = each.value.error_report_configuration != null ? each.value.error_report_configuration : []
    content {

      dynamic "s3_configuration" {
        for_each = error_report_configuration.value.s3_configuration != null ? error_report_configuration.value.s3_configuration : []
        content {
          bucket_name       = s3_configuration.value.bucket_name
          encryption_option = s3_configuration.value.encryption_option
          object_key_prefix = s3_configuration.value.object_key_prefix
        }
      }
    }
  }

  dynamic "last_run_summary" {
    for_each = each.value.last_run_summary != null ? each.value.last_run_summary : []
    content {

      dynamic "error_report_location" {
        for_each = last_run_summary.value.error_report_location != null ? last_run_summary.value.error_report_location : []
        content {

          dynamic "s3_report_location" {
            for_each = error_report_location.value.s3_report_location != null ? error_report_location.value.s3_report_location : []
            content {
            }
          }
        }
      }

      dynamic "execution_stats" {
        for_each = last_run_summary.value.execution_stats != null ? last_run_summary.value.execution_stats : []
        content {
        }
      }

      dynamic "query_insights_response" {
        for_each = last_run_summary.value.query_insights_response != null ? last_run_summary.value.query_insights_response : []
        content {

          dynamic "query_spatial_coverage" {
            for_each = query_insights_response.value.query_spatial_coverage != null ? query_insights_response.value.query_spatial_coverage : []
            content {

              dynamic "max" {
                for_each = query_spatial_coverage.value.max != null ? query_spatial_coverage.value.max : []
                content {
                }
              }
            }
          }

          dynamic "query_temporal_range" {
            for_each = query_insights_response.value.query_temporal_range != null ? query_insights_response.value.query_temporal_range : []
            content {

              dynamic "max" {
                for_each = query_temporal_range.value.max != null ? query_temporal_range.value.max : []
                content {
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "notification_configuration" {
    for_each = each.value.notification_configuration != null ? each.value.notification_configuration : []
    content {

      dynamic "sns_configuration" {
        for_each = notification_configuration.value.sns_configuration != null ? notification_configuration.value.sns_configuration : []
        content {
          topic_arn = sns_configuration.value.topic_arn
        }
      }
    }
  }

  dynamic "recently_failed_runs" {
    for_each = each.value.recently_failed_runs != null ? each.value.recently_failed_runs : []
    content {

      dynamic "error_report_location" {
        for_each = recently_failed_runs.value.error_report_location != null ? recently_failed_runs.value.error_report_location : []
        content {

          dynamic "s3_report_location" {
            for_each = error_report_location.value.s3_report_location != null ? error_report_location.value.s3_report_location : []
            content {
            }
          }
        }
      }

      dynamic "execution_stats" {
        for_each = recently_failed_runs.value.execution_stats != null ? recently_failed_runs.value.execution_stats : []
        content {
        }
      }

      dynamic "query_insights_response" {
        for_each = recently_failed_runs.value.query_insights_response != null ? recently_failed_runs.value.query_insights_response : []
        content {

          dynamic "query_spatial_coverage" {
            for_each = query_insights_response.value.query_spatial_coverage != null ? query_insights_response.value.query_spatial_coverage : []
            content {

              dynamic "max" {
                for_each = query_spatial_coverage.value.max != null ? query_spatial_coverage.value.max : []
                content {
                }
              }
            }
          }

          dynamic "query_temporal_range" {
            for_each = query_insights_response.value.query_temporal_range != null ? query_insights_response.value.query_temporal_range : []
            content {

              dynamic "max" {
                for_each = query_temporal_range.value.max != null ? query_temporal_range.value.max : []
                content {
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "schedule_configuration" {
    for_each = each.value.schedule_configuration != null ? each.value.schedule_configuration : []
    content {
      schedule_expression = schedule_configuration.value.schedule_expression
    }
  }

  dynamic "target_configuration" {
    for_each = each.value.target_configuration != null ? each.value.target_configuration : []
    content {

      dynamic "timestream_configuration" {
        for_each = target_configuration.value.timestream_configuration != null ? target_configuration.value.timestream_configuration : []
        content {
          database_name       = timestream_configuration.value.database_name
          table_name          = timestream_configuration.value.table_name
          time_column         = timestream_configuration.value.time_column
          measure_name_column = timestream_configuration.value.measure_name_column

          dynamic "dimension_mapping" {
            for_each = timestream_configuration.value.dimension_mapping != null ? timestream_configuration.value.dimension_mapping : []
            content {
              dimension_value_type = dimension_mapping.value.dimension_value_type
              name                 = dimension_mapping.value.name
            }
          }

          dynamic "mixed_measure_mapping" {
            for_each = timestream_configuration.value.mixed_measure_mapping != null ? timestream_configuration.value.mixed_measure_mapping : []
            content {
              measure_value_type  = mixed_measure_mapping.value.measure_value_type
              measure_name        = mixed_measure_mapping.value.measure_name
              source_column       = mixed_measure_mapping.value.source_column
              target_measure_name = mixed_measure_mapping.value.target_measure_name

              dynamic "multi_measure_attribute_mapping" {
                for_each = mixed_measure_mapping.value.multi_measure_attribute_mapping != null ? mixed_measure_mapping.value.multi_measure_attribute_mapping : []
                content {
                  measure_value_type                  = multi_measure_attribute_mapping.value.measure_value_type
                  source_column                       = multi_measure_attribute_mapping.value.source_column
                  target_multi_measure_attribute_name = multi_measure_attribute_mapping.value.target_multi_measure_attribute_name
                }
              }
            }
          }

          dynamic "multi_measure_mappings" {
            for_each = timestream_configuration.value.multi_measure_mappings != null ? timestream_configuration.value.multi_measure_mappings : []
            content {
              target_multi_measure_name = multi_measure_mappings.value.target_multi_measure_name

              dynamic "multi_measure_attribute_mapping" {
                for_each = multi_measure_mappings.value.multi_measure_attribute_mapping != null ? multi_measure_mappings.value.multi_measure_attribute_mapping : []
                content {
                  measure_value_type                  = multi_measure_attribute_mapping.value.measure_value_type
                  source_column                       = multi_measure_attribute_mapping.value.source_column
                  target_multi_measure_attribute_name = multi_measure_attribute_mapping.value.target_multi_measure_attribute_name
                }
              }
            }
          }
        }
      }
    }
  }
}
