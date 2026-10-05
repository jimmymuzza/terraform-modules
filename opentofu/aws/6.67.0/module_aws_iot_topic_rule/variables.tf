variable "iot_topic_rules" {
  description = <<EOT
Map of iot_topic_rules, attributes below
Required:
    - enabled
    - name
    - sql
    - sql_version
Optional:
    - description
    - region
    - tags
    - tags_all
    - cloudwatch_alarm
    - cloudwatch_logs
    - cloudwatch_metric
    - dynamodb
    - dynamodbv2
    - elasticsearch
    - error_action
    - firehose
    - http
    - iot_analytics
    - iot_events
    - kafka
    - kinesis
    - lambda
    - republish
    - s3
    - sns
    - sqs
    - step_functions
    - timestream
EOT

  type = map(object({
    enabled           = bool
    name              = string
    sql               = string
    sql_version       = string
    description       = optional(string)
    region            = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    cloudwatch_alarm  = optional(set(object({
            alarm_name   = string
            role_arn     = string
            state_reason = string
            state_value  = string
        })))
    cloudwatch_logs   = optional(set(object({
            log_group_name = string
            role_arn       = string
            batch_mode     = optional(bool)
        })))
    cloudwatch_metric = optional(set(object({
            metric_name      = string
            metric_namespace = string
            metric_unit      = string
            metric_value     = string
            role_arn         = string
            metric_timestamp = optional(string)
        })))
    dynamodb          = optional(set(object({
            hash_key_field  = string
            hash_key_value  = string
            role_arn        = string
            table_name      = string
            hash_key_type   = optional(string)
            operation       = optional(string)
            payload_field   = optional(string)
            range_key_field = optional(string)
            range_key_type  = optional(string)
            range_key_value = optional(string)
        })))
    dynamodbv2        = optional(set(object({
            role_arn = string
            put_item = optional(list(object({
                table_name = string
            })))
        })))
    elasticsearch     = optional(set(object({
            endpoint = string
            index    = string
            role_arn = string
            type     = string
        })))
    error_action      = optional(list(object({
            cloudwatch_alarm  = optional(list(object({
                alarm_name   = string
                role_arn     = string
                state_reason = string
                state_value  = string
            })))
            cloudwatch_logs   = optional(list(object({
                log_group_name = string
                role_arn       = string
                batch_mode     = optional(bool)
            })))
            cloudwatch_metric = optional(list(object({
                metric_name      = string
                metric_namespace = string
                metric_unit      = string
                metric_value     = string
                role_arn         = string
                metric_timestamp = optional(string)
            })))
            dynamodb          = optional(list(object({
                hash_key_field  = string
                hash_key_value  = string
                role_arn        = string
                table_name      = string
                hash_key_type   = optional(string)
                operation       = optional(string)
                payload_field   = optional(string)
                range_key_field = optional(string)
                range_key_type  = optional(string)
                range_key_value = optional(string)
            })))
            dynamodbv2        = optional(list(object({
                role_arn = string
                put_item = optional(list(object({
                    table_name = string
                })))
            })))
            elasticsearch     = optional(list(object({
                endpoint = string
                index    = string
                role_arn = string
                type     = string
            })))
            firehose          = optional(list(object({
                delivery_stream_name = string
                role_arn             = string
                batch_mode           = optional(bool)
                separator            = optional(string)
            })))
            http              = optional(list(object({
                url              = string
                confirmation_url = optional(string)
                http_header      = optional(list(object({
                    key   = string
                    value = string
                })))
            })))
            iot_analytics     = optional(list(object({
                channel_name = string
                role_arn     = string
                batch_mode   = optional(bool)
            })))
            iot_events        = optional(list(object({
                input_name = string
                role_arn   = string
                batch_mode = optional(bool)
                message_id = optional(string)
            })))
            kafka             = optional(list(object({
                client_properties = map(string)
                destination_arn   = string
                topic             = string
                key               = optional(string)
                partition         = optional(string)
                header            = optional(list(object({
                    key   = string
                    value = string
                })))
            })))
            kinesis           = optional(list(object({
                role_arn      = string
                stream_name   = string
                partition_key = optional(string)
            })))
            lambda            = optional(list(object({
                function_arn = string
            })))
            republish         = optional(list(object({
                role_arn = string
                topic    = string
                qos      = optional(number)
            })))
            s3                = optional(list(object({
                bucket_name = string
                key         = string
                role_arn    = string
                canned_acl  = optional(string)
            })))
            sns               = optional(list(object({
                role_arn       = string
                target_arn     = string
                message_format = optional(string)
            })))
            sqs               = optional(list(object({
                queue_url  = string
                role_arn   = string
                use_base64 = bool
            })))
            step_functions    = optional(list(object({
                role_arn              = string
                state_machine_name    = string
                execution_name_prefix = optional(string)
            })))
            timestream        = optional(list(object({
                database_name = string
                role_arn      = string
                table_name    = string
                dimension     = set(object({
                    name  = string
                    value = string
                }))
                timestamp     = optional(list(object({
                    unit  = string
                    value = string
                })))
            })))
        })))
    firehose          = optional(set(object({
            delivery_stream_name = string
            role_arn             = string
            batch_mode           = optional(bool)
            separator            = optional(string)
        })))
    http              = optional(set(object({
            url              = string
            confirmation_url = optional(string)
            http_header      = optional(list(object({
                key   = string
                value = string
            })))
        })))
    iot_analytics     = optional(set(object({
            channel_name = string
            role_arn     = string
            batch_mode   = optional(bool)
        })))
    iot_events        = optional(set(object({
            input_name = string
            role_arn   = string
            batch_mode = optional(bool)
            message_id = optional(string)
        })))
    kafka             = optional(set(object({
            client_properties = map(string)
            destination_arn   = string
            topic             = string
            key               = optional(string)
            partition         = optional(string)
            header            = optional(list(object({
                key   = string
                value = string
            })))
        })))
    kinesis           = optional(set(object({
            role_arn      = string
            stream_name   = string
            partition_key = optional(string)
        })))
    lambda            = optional(set(object({
            function_arn = string
        })))
    republish         = optional(set(object({
            role_arn = string
            topic    = string
            qos      = optional(number)
        })))
    s3                = optional(set(object({
            bucket_name = string
            key         = string
            role_arn    = string
            canned_acl  = optional(string)
        })))
    sns               = optional(set(object({
            role_arn       = string
            target_arn     = string
            message_format = optional(string)
        })))
    sqs               = optional(set(object({
            queue_url  = string
            role_arn   = string
            use_base64 = bool
        })))
    step_functions    = optional(set(object({
            role_arn              = string
            state_machine_name    = string
            execution_name_prefix = optional(string)
        })))
    timestream        = optional(set(object({
            database_name = string
            role_arn      = string
            table_name    = string
            dimension     = set(object({
                name  = string
                value = string
            }))
            timestamp     = optional(list(object({
                unit  = string
                value = string
            })))
        })))
  }))
}
