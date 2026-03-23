resource "aws_kinesis_analytics_application" "kinesis_analytics_applications" {
  for_each = var.kinesis_analytics_applications

  name              = each.value.name
  code              = each.value.code
  description       = each.value.description
  region            = each.value.region
  start_application = each.value.start_application
  tags              = each.value.tags
  tags_all          = each.value.tags_all

  dynamic "cloudwatch_logging_options" {
    for_each = each.value.cloudwatch_logging_options != null ? each.value.cloudwatch_logging_options : []
    content {
      log_stream_arn = cloudwatch_logging_options.value.log_stream_arn
      role_arn       = cloudwatch_logging_options.value.role_arn
    }
  }

  dynamic "inputs" {
    for_each = each.value.inputs != null ? each.value.inputs : []
    content {
      name_prefix = inputs.value.name_prefix

      dynamic "kinesis_firehose" {
        for_each = inputs.value.kinesis_firehose != null ? inputs.value.kinesis_firehose : []
        content {
          resource_arn = kinesis_firehose.value.resource_arn
          role_arn     = kinesis_firehose.value.role_arn
        }
      }

      dynamic "kinesis_stream" {
        for_each = inputs.value.kinesis_stream != null ? inputs.value.kinesis_stream : []
        content {
          resource_arn = kinesis_stream.value.resource_arn
          role_arn     = kinesis_stream.value.role_arn
        }
      }

      dynamic "parallelism" {
        for_each = inputs.value.parallelism != null ? inputs.value.parallelism : []
        content {
          count = parallelism.value.count
        }
      }

      dynamic "processing_configuration" {
        for_each = inputs.value.processing_configuration != null ? inputs.value.processing_configuration : []
        content {

          dynamic "lambda" {
            for_each = processing_configuration.value.lambda != null ? processing_configuration.value.lambda : []
            content {
              resource_arn = lambda.value.resource_arn
              role_arn     = lambda.value.role_arn
            }
          }
        }
      }

      dynamic "schema" {
        for_each = inputs.value.schema != null ? inputs.value.schema : []
        content {
          record_encoding = schema.value.record_encoding

          dynamic "record_columns" {
            for_each = schema.value.record_columns != null ? schema.value.record_columns : []
            content {
              name     = record_columns.value.name
              sql_type = record_columns.value.sql_type
              mapping  = record_columns.value.mapping
            }
          }

          dynamic "record_format" {
            for_each = schema.value.record_format != null ? schema.value.record_format : []
            content {

              dynamic "mapping_parameters" {
                for_each = record_format.value.mapping_parameters != null ? record_format.value.mapping_parameters : []
                content {

                  dynamic "csv" {
                    for_each = mapping_parameters.value.csv != null ? mapping_parameters.value.csv : []
                    content {
                      record_column_delimiter = csv.value.record_column_delimiter
                      record_row_delimiter    = csv.value.record_row_delimiter
                    }
                  }

                  dynamic "json" {
                    for_each = mapping_parameters.value.json != null ? mapping_parameters.value.json : []
                    content {
                      record_row_path = json.value.record_row_path
                    }
                  }
                }
              }
            }
          }
        }
      }

      dynamic "starting_position_configuration" {
        for_each = inputs.value.starting_position_configuration != null ? inputs.value.starting_position_configuration : []
        content {
          starting_position = starting_position_configuration.value.starting_position
        }
      }
    }
  }

  dynamic "outputs" {
    for_each = each.value.outputs != null ? each.value.outputs : []
    content {
      name = outputs.value.name

      dynamic "kinesis_firehose" {
        for_each = outputs.value.kinesis_firehose != null ? outputs.value.kinesis_firehose : []
        content {
          resource_arn = kinesis_firehose.value.resource_arn
          role_arn     = kinesis_firehose.value.role_arn
        }
      }

      dynamic "kinesis_stream" {
        for_each = outputs.value.kinesis_stream != null ? outputs.value.kinesis_stream : []
        content {
          resource_arn = kinesis_stream.value.resource_arn
          role_arn     = kinesis_stream.value.role_arn
        }
      }

      dynamic "lambda" {
        for_each = outputs.value.lambda != null ? outputs.value.lambda : []
        content {
          resource_arn = lambda.value.resource_arn
          role_arn     = lambda.value.role_arn
        }
      }

      dynamic "schema" {
        for_each = outputs.value.schema != null ? outputs.value.schema : []
        content {
          record_format_type = schema.value.record_format_type
        }
      }
    }
  }

  dynamic "reference_data_sources" {
    for_each = each.value.reference_data_sources != null ? each.value.reference_data_sources : []
    content {
      table_name = reference_data_sources.value.table_name

      dynamic "s3" {
        for_each = reference_data_sources.value.s3 != null ? reference_data_sources.value.s3 : []
        content {
          bucket_arn = s3.value.bucket_arn
          file_key   = s3.value.file_key
          role_arn   = s3.value.role_arn
        }
      }

      dynamic "schema" {
        for_each = reference_data_sources.value.schema != null ? reference_data_sources.value.schema : []
        content {
          record_encoding = schema.value.record_encoding

          dynamic "record_columns" {
            for_each = schema.value.record_columns != null ? schema.value.record_columns : []
            content {
              name     = record_columns.value.name
              sql_type = record_columns.value.sql_type
              mapping  = record_columns.value.mapping
            }
          }

          dynamic "record_format" {
            for_each = schema.value.record_format != null ? schema.value.record_format : []
            content {

              dynamic "mapping_parameters" {
                for_each = record_format.value.mapping_parameters != null ? record_format.value.mapping_parameters : []
                content {

                  dynamic "csv" {
                    for_each = mapping_parameters.value.csv != null ? mapping_parameters.value.csv : []
                    content {
                      record_column_delimiter = csv.value.record_column_delimiter
                      record_row_delimiter    = csv.value.record_row_delimiter
                    }
                  }

                  dynamic "json" {
                    for_each = mapping_parameters.value.json != null ? mapping_parameters.value.json : []
                    content {
                      record_row_path = json.value.record_row_path
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
}
