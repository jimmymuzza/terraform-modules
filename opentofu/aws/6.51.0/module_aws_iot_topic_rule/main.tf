resource "aws_iot_topic_rule" "iot_topic_rules" {
  for_each = var.iot_topic_rules

  enabled     = each.value.enabled
  name        = each.value.name
  sql         = each.value.sql
  sql_version = each.value.sql_version
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "cloudwatch_alarm" {
    for_each = each.value.cloudwatch_alarm != null ? each.value.cloudwatch_alarm : []
    content {
      alarm_name   = cloudwatch_alarm.value.alarm_name
      role_arn     = cloudwatch_alarm.value.role_arn
      state_reason = cloudwatch_alarm.value.state_reason
      state_value  = cloudwatch_alarm.value.state_value
    }
  }

  dynamic "cloudwatch_logs" {
    for_each = each.value.cloudwatch_logs != null ? each.value.cloudwatch_logs : []
    content {
      log_group_name = cloudwatch_logs.value.log_group_name
      role_arn       = cloudwatch_logs.value.role_arn
      batch_mode     = cloudwatch_logs.value.batch_mode
    }
  }

  dynamic "cloudwatch_metric" {
    for_each = each.value.cloudwatch_metric != null ? each.value.cloudwatch_metric : []
    content {
      metric_name      = cloudwatch_metric.value.metric_name
      metric_namespace = cloudwatch_metric.value.metric_namespace
      metric_unit      = cloudwatch_metric.value.metric_unit
      metric_value     = cloudwatch_metric.value.metric_value
      role_arn         = cloudwatch_metric.value.role_arn
      metric_timestamp = cloudwatch_metric.value.metric_timestamp
    }
  }

  dynamic "dynamodb" {
    for_each = each.value.dynamodb != null ? each.value.dynamodb : []
    content {
      hash_key_field  = dynamodb.value.hash_key_field
      hash_key_value  = dynamodb.value.hash_key_value
      role_arn        = dynamodb.value.role_arn
      table_name      = dynamodb.value.table_name
      hash_key_type   = dynamodb.value.hash_key_type
      operation       = dynamodb.value.operation
      payload_field   = dynamodb.value.payload_field
      range_key_field = dynamodb.value.range_key_field
      range_key_type  = dynamodb.value.range_key_type
      range_key_value = dynamodb.value.range_key_value
    }
  }

  dynamic "dynamodbv2" {
    for_each = each.value.dynamodbv2 != null ? each.value.dynamodbv2 : []
    content {
      role_arn = dynamodbv2.value.role_arn

      dynamic "put_item" {
        for_each = dynamodbv2.value.put_item != null ? dynamodbv2.value.put_item : []
        content {
          table_name = put_item.value.table_name
        }
      }
    }
  }

  dynamic "elasticsearch" {
    for_each = each.value.elasticsearch != null ? each.value.elasticsearch : []
    content {
      endpoint = elasticsearch.value.endpoint
      index    = elasticsearch.value.index
      role_arn = elasticsearch.value.role_arn
      type     = elasticsearch.value.type
    }
  }

  dynamic "error_action" {
    for_each = each.value.error_action != null ? each.value.error_action : []
    content {

      dynamic "cloudwatch_alarm" {
        for_each = error_action.value.cloudwatch_alarm != null ? error_action.value.cloudwatch_alarm : []
        content {
          alarm_name   = cloudwatch_alarm.value.alarm_name
          role_arn     = cloudwatch_alarm.value.role_arn
          state_reason = cloudwatch_alarm.value.state_reason
          state_value  = cloudwatch_alarm.value.state_value
        }
      }

      dynamic "cloudwatch_logs" {
        for_each = error_action.value.cloudwatch_logs != null ? error_action.value.cloudwatch_logs : []
        content {
          log_group_name = cloudwatch_logs.value.log_group_name
          role_arn       = cloudwatch_logs.value.role_arn
          batch_mode     = cloudwatch_logs.value.batch_mode
        }
      }

      dynamic "cloudwatch_metric" {
        for_each = error_action.value.cloudwatch_metric != null ? error_action.value.cloudwatch_metric : []
        content {
          metric_name      = cloudwatch_metric.value.metric_name
          metric_namespace = cloudwatch_metric.value.metric_namespace
          metric_unit      = cloudwatch_metric.value.metric_unit
          metric_value     = cloudwatch_metric.value.metric_value
          role_arn         = cloudwatch_metric.value.role_arn
          metric_timestamp = cloudwatch_metric.value.metric_timestamp
        }
      }

      dynamic "dynamodb" {
        for_each = error_action.value.dynamodb != null ? error_action.value.dynamodb : []
        content {
          hash_key_field  = dynamodb.value.hash_key_field
          hash_key_value  = dynamodb.value.hash_key_value
          role_arn        = dynamodb.value.role_arn
          table_name      = dynamodb.value.table_name
          hash_key_type   = dynamodb.value.hash_key_type
          operation       = dynamodb.value.operation
          payload_field   = dynamodb.value.payload_field
          range_key_field = dynamodb.value.range_key_field
          range_key_type  = dynamodb.value.range_key_type
          range_key_value = dynamodb.value.range_key_value
        }
      }

      dynamic "dynamodbv2" {
        for_each = error_action.value.dynamodbv2 != null ? error_action.value.dynamodbv2 : []
        content {
          role_arn = dynamodbv2.value.role_arn

          dynamic "put_item" {
            for_each = dynamodbv2.value.put_item != null ? dynamodbv2.value.put_item : []
            content {
              table_name = put_item.value.table_name
            }
          }
        }
      }

      dynamic "elasticsearch" {
        for_each = error_action.value.elasticsearch != null ? error_action.value.elasticsearch : []
        content {
          endpoint = elasticsearch.value.endpoint
          index    = elasticsearch.value.index
          role_arn = elasticsearch.value.role_arn
          type     = elasticsearch.value.type
        }
      }

      dynamic "firehose" {
        for_each = error_action.value.firehose != null ? error_action.value.firehose : []
        content {
          delivery_stream_name = firehose.value.delivery_stream_name
          role_arn             = firehose.value.role_arn
          batch_mode           = firehose.value.batch_mode
          separator            = firehose.value.separator
        }
      }

      dynamic "http" {
        for_each = error_action.value.http != null ? error_action.value.http : []
        content {
          url              = http.value.url
          confirmation_url = http.value.confirmation_url

          dynamic "http_header" {
            for_each = http.value.http_header != null ? http.value.http_header : []
            content {
              key   = http_header.value.key
              value = http_header.value.value
            }
          }
        }
      }

      dynamic "iot_analytics" {
        for_each = error_action.value.iot_analytics != null ? error_action.value.iot_analytics : []
        content {
          channel_name = iot_analytics.value.channel_name
          role_arn     = iot_analytics.value.role_arn
          batch_mode   = iot_analytics.value.batch_mode
        }
      }

      dynamic "iot_events" {
        for_each = error_action.value.iot_events != null ? error_action.value.iot_events : []
        content {
          input_name = iot_events.value.input_name
          role_arn   = iot_events.value.role_arn
          batch_mode = iot_events.value.batch_mode
          message_id = iot_events.value.message_id
        }
      }

      dynamic "kafka" {
        for_each = error_action.value.kafka != null ? error_action.value.kafka : []
        content {
          client_properties = kafka.value.client_properties
          destination_arn   = kafka.value.destination_arn
          topic             = kafka.value.topic
          key               = kafka.value.key
          partition         = kafka.value.partition

          dynamic "header" {
            for_each = kafka.value.header != null ? kafka.value.header : []
            content {
              key   = header.value.key
              value = header.value.value
            }
          }
        }
      }

      dynamic "kinesis" {
        for_each = error_action.value.kinesis != null ? error_action.value.kinesis : []
        content {
          role_arn      = kinesis.value.role_arn
          stream_name   = kinesis.value.stream_name
          partition_key = kinesis.value.partition_key
        }
      }

      dynamic "lambda" {
        for_each = error_action.value.lambda != null ? error_action.value.lambda : []
        content {
          function_arn = lambda.value.function_arn
        }
      }

      dynamic "republish" {
        for_each = error_action.value.republish != null ? error_action.value.republish : []
        content {
          role_arn = republish.value.role_arn
          topic    = republish.value.topic
          qos      = republish.value.qos
        }
      }

      dynamic "s3" {
        for_each = error_action.value.s3 != null ? error_action.value.s3 : []
        content {
          bucket_name = s3.value.bucket_name
          key         = s3.value.key
          role_arn    = s3.value.role_arn
          canned_acl  = s3.value.canned_acl
        }
      }

      dynamic "sns" {
        for_each = error_action.value.sns != null ? error_action.value.sns : []
        content {
          role_arn       = sns.value.role_arn
          target_arn     = sns.value.target_arn
          message_format = sns.value.message_format
        }
      }

      dynamic "sqs" {
        for_each = error_action.value.sqs != null ? error_action.value.sqs : []
        content {
          queue_url  = sqs.value.queue_url
          role_arn   = sqs.value.role_arn
          use_base64 = sqs.value.use_base64
        }
      }

      dynamic "step_functions" {
        for_each = error_action.value.step_functions != null ? error_action.value.step_functions : []
        content {
          role_arn              = step_functions.value.role_arn
          state_machine_name    = step_functions.value.state_machine_name
          execution_name_prefix = step_functions.value.execution_name_prefix
        }
      }

      dynamic "timestream" {
        for_each = error_action.value.timestream != null ? error_action.value.timestream : []
        content {
          database_name = timestream.value.database_name
          role_arn      = timestream.value.role_arn
          table_name    = timestream.value.table_name

          dynamic "dimension" {
            for_each = timestream.value.dimension != null ? timestream.value.dimension : []
            content {
              name  = dimension.value.name
              value = dimension.value.value
            }
          }

          dynamic "timestamp" {
            for_each = timestream.value.timestamp != null ? timestream.value.timestamp : []
            content {
              unit  = timestamp.value.unit
              value = timestamp.value.value
            }
          }
        }
      }
    }
  }

  dynamic "firehose" {
    for_each = each.value.firehose != null ? each.value.firehose : []
    content {
      delivery_stream_name = firehose.value.delivery_stream_name
      role_arn             = firehose.value.role_arn
      batch_mode           = firehose.value.batch_mode
      separator            = firehose.value.separator
    }
  }

  dynamic "http" {
    for_each = each.value.http != null ? each.value.http : []
    content {
      url              = http.value.url
      confirmation_url = http.value.confirmation_url

      dynamic "http_header" {
        for_each = http.value.http_header != null ? http.value.http_header : []
        content {
          key   = http_header.value.key
          value = http_header.value.value
        }
      }
    }
  }

  dynamic "iot_analytics" {
    for_each = each.value.iot_analytics != null ? each.value.iot_analytics : []
    content {
      channel_name = iot_analytics.value.channel_name
      role_arn     = iot_analytics.value.role_arn
      batch_mode   = iot_analytics.value.batch_mode
    }
  }

  dynamic "iot_events" {
    for_each = each.value.iot_events != null ? each.value.iot_events : []
    content {
      input_name = iot_events.value.input_name
      role_arn   = iot_events.value.role_arn
      batch_mode = iot_events.value.batch_mode
      message_id = iot_events.value.message_id
    }
  }

  dynamic "kafka" {
    for_each = each.value.kafka != null ? each.value.kafka : []
    content {
      client_properties = kafka.value.client_properties
      destination_arn   = kafka.value.destination_arn
      topic             = kafka.value.topic
      key               = kafka.value.key
      partition         = kafka.value.partition

      dynamic "header" {
        for_each = kafka.value.header != null ? kafka.value.header : []
        content {
          key   = header.value.key
          value = header.value.value
        }
      }
    }
  }

  dynamic "kinesis" {
    for_each = each.value.kinesis != null ? each.value.kinesis : []
    content {
      role_arn      = kinesis.value.role_arn
      stream_name   = kinesis.value.stream_name
      partition_key = kinesis.value.partition_key
    }
  }

  dynamic "lambda" {
    for_each = each.value.lambda != null ? each.value.lambda : []
    content {
      function_arn = lambda.value.function_arn
    }
  }

  dynamic "republish" {
    for_each = each.value.republish != null ? each.value.republish : []
    content {
      role_arn = republish.value.role_arn
      topic    = republish.value.topic
      qos      = republish.value.qos
    }
  }

  dynamic "s3" {
    for_each = each.value.s3 != null ? each.value.s3 : []
    content {
      bucket_name = s3.value.bucket_name
      key         = s3.value.key
      role_arn    = s3.value.role_arn
      canned_acl  = s3.value.canned_acl
    }
  }

  dynamic "sns" {
    for_each = each.value.sns != null ? each.value.sns : []
    content {
      role_arn       = sns.value.role_arn
      target_arn     = sns.value.target_arn
      message_format = sns.value.message_format
    }
  }

  dynamic "sqs" {
    for_each = each.value.sqs != null ? each.value.sqs : []
    content {
      queue_url  = sqs.value.queue_url
      role_arn   = sqs.value.role_arn
      use_base64 = sqs.value.use_base64
    }
  }

  dynamic "step_functions" {
    for_each = each.value.step_functions != null ? each.value.step_functions : []
    content {
      role_arn              = step_functions.value.role_arn
      state_machine_name    = step_functions.value.state_machine_name
      execution_name_prefix = step_functions.value.execution_name_prefix
    }
  }

  dynamic "timestream" {
    for_each = each.value.timestream != null ? each.value.timestream : []
    content {
      database_name = timestream.value.database_name
      role_arn      = timestream.value.role_arn
      table_name    = timestream.value.table_name

      dynamic "dimension" {
        for_each = timestream.value.dimension != null ? timestream.value.dimension : []
        content {
          name  = dimension.value.name
          value = dimension.value.value
        }
      }

      dynamic "timestamp" {
        for_each = timestream.value.timestamp != null ? timestream.value.timestamp : []
        content {
          unit  = timestamp.value.unit
          value = timestamp.value.value
        }
      }
    }
  }
}
