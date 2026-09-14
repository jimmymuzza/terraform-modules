variable "pipes_pipes" {
  description = <<EOT
Map of pipes_pipes, attributes below
Required:
    - role_arn
    - source
    - target
Optional:
    - description
    - desired_state
    - enrichment
    - kms_key_identifier
    - name
    - name_prefix
    - region
    - tags
    - tags_all
    - enrichment_parameters
    - log_configuration
    - source_parameters
    - target_parameters
EOT

  type = map(object({
    role_arn              = string
    source                = string
    target                = string
    description           = optional(string)
    desired_state         = optional(string)
    enrichment            = optional(string)
    kms_key_identifier    = optional(string)
    name                  = optional(string)
    name_prefix           = optional(string)
    region                = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    enrichment_parameters = optional(list(object({
            input_template  = optional(string)
            http_parameters = optional(list(object({
                header_parameters       = optional(map(string))
                path_parameter_values   = optional(list(string))
                query_string_parameters = optional(map(string))
            })))
        })))
    log_configuration     = optional(list(object({
            level                           = string
            include_execution_data          = optional(set(string))
            cloudwatch_logs_log_destination = optional(list(object({
                log_group_arn = string
            })))
            firehose_log_destination        = optional(list(object({
                delivery_stream_arn = string
            })))
            s3_log_destination              = optional(list(object({
                bucket_name   = string
                bucket_owner  = string
                output_format = optional(string)
                prefix        = optional(string)
            })))
        })))
    source_parameters     = optional(list(object({
            activemq_broker_parameters         = optional(list(object({
                queue_name                         = string
                batch_size                         = optional(number)
                maximum_batching_window_in_seconds = optional(number)
                credentials                        = list(object({
                    basic_auth = string
                }))
            })))
            dynamodb_stream_parameters         = optional(list(object({
                starting_position                  = string
                batch_size                         = optional(number)
                maximum_batching_window_in_seconds = optional(number)
                maximum_record_age_in_seconds      = optional(number)
                maximum_retry_attempts             = optional(number)
                on_partial_batch_item_failure      = optional(string)
                parallelization_factor             = optional(number)
                dead_letter_config                 = optional(list(object({
                    arn = optional(string)
                })))
            })))
            filter_criteria                    = optional(list(object({
                filter = optional(list(object({
                    pattern = string
                })))
            })))
            kinesis_stream_parameters          = optional(list(object({
                starting_position                  = string
                batch_size                         = optional(number)
                maximum_batching_window_in_seconds = optional(number)
                maximum_record_age_in_seconds      = optional(number)
                maximum_retry_attempts             = optional(number)
                on_partial_batch_item_failure      = optional(string)
                parallelization_factor             = optional(number)
                starting_position_timestamp        = optional(string)
                dead_letter_config                 = optional(list(object({
                    arn = optional(string)
                })))
            })))
            managed_streaming_kafka_parameters = optional(list(object({
                topic_name                         = string
                batch_size                         = optional(number)
                consumer_group_id                  = optional(string)
                maximum_batching_window_in_seconds = optional(number)
                starting_position                  = optional(string)
                credentials                        = optional(list(object({
                    client_certificate_tls_auth = optional(string)
                    sasl_scram_512_auth         = optional(string)
                })))
            })))
            rabbitmq_broker_parameters         = optional(list(object({
                queue_name                         = string
                batch_size                         = optional(number)
                maximum_batching_window_in_seconds = optional(number)
                virtual_host                       = optional(string)
                credentials                        = list(object({
                    basic_auth = string
                }))
            })))
            self_managed_kafka_parameters      = optional(list(object({
                topic_name                         = string
                additional_bootstrap_servers       = optional(set(string))
                batch_size                         = optional(number)
                consumer_group_id                  = optional(string)
                maximum_batching_window_in_seconds = optional(number)
                server_root_ca_certificate         = optional(string)
                starting_position                  = optional(string)
                credentials                        = optional(list(object({
                    basic_auth                  = optional(string)
                    client_certificate_tls_auth = optional(string)
                    sasl_scram_256_auth         = optional(string)
                    sasl_scram_512_auth         = optional(string)
                })))
                vpc                                = optional(list(object({
                    security_groups = optional(set(string))
                    subnets         = optional(set(string))
                })))
            })))
            sqs_queue_parameters               = optional(list(object({
                batch_size                         = optional(number)
                maximum_batching_window_in_seconds = optional(number)
            })))
        })))
    target_parameters     = optional(list(object({
            input_template                         = optional(string)
            batch_job_parameters                   = optional(list(object({
                job_definition      = string
                job_name            = string
                parameters          = optional(map(string))
                array_properties    = optional(list(object({
                    size = optional(number)
                })))
                container_overrides = optional(list(object({
                    command              = optional(list(string))
                    instance_type        = optional(string)
                    environment          = optional(list(object({
                        name  = optional(string)
                        value = optional(string)
                    })))
                    resource_requirement = optional(list(object({
                        type  = string
                        value = string
                    })))
                })))
                depends_on          = optional(list(object({
                    job_id = optional(string)
                    type   = optional(string)
                })))
                retry_strategy      = optional(list(object({
                    attempts = optional(number)
                })))
            })))
            cloudwatch_logs_parameters             = optional(list(object({
                log_stream_name = optional(string)
                timestamp       = optional(string)
            })))
            ecs_task_parameters                    = optional(list(object({
                task_definition_arn        = string
                enable_ecs_managed_tags    = optional(bool)
                enable_execute_command     = optional(bool)
                group                      = optional(string)
                launch_type                = optional(string)
                platform_version           = optional(string)
                propagate_tags             = optional(string)
                reference_id               = optional(string)
                tags                       = optional(map(string))
                task_count                 = optional(number)
                capacity_provider_strategy = optional(list(object({
                    capacity_provider = string
                    base              = optional(number)
                    weight            = optional(number)
                })))
                network_configuration      = optional(list(object({
                    aws_vpc_configuration = optional(list(object({
                        assign_public_ip = optional(string)
                        security_groups  = optional(set(string))
                        subnets          = optional(set(string))
                    })))
                })))
                overrides                  = optional(list(object({
                    cpu                            = optional(string)
                    execution_role_arn             = optional(string)
                    memory                         = optional(string)
                    task_role_arn                  = optional(string)
                    container_override             = optional(list(object({
                        command              = optional(list(string))
                        cpu                  = optional(number)
                        memory               = optional(number)
                        memory_reservation   = optional(number)
                        name                 = optional(string)
                        environment          = optional(list(object({
                            name  = optional(string)
                            value = optional(string)
                        })))
                        environment_file     = optional(list(object({
                            type  = string
                            value = string
                        })))
                        resource_requirement = optional(list(object({
                            type  = string
                            value = string
                        })))
                    })))
                    ephemeral_storage              = optional(list(object({
                        size_in_gib = number
                    })))
                    inference_accelerator_override = optional(list(object({
                        device_name = optional(string)
                        device_type = optional(string)
                    })))
                })))
                placement_constraint       = optional(list(object({
                    expression = optional(string)
                    type       = optional(string)
                })))
                placement_strategy         = optional(list(object({
                    field = optional(string)
                    type  = optional(string)
                })))
            })))
            eventbridge_event_bus_parameters       = optional(list(object({
                detail_type = optional(string)
                endpoint_id = optional(string)
                resources   = optional(set(string))
                source      = optional(string)
                time        = optional(string)
            })))
            http_parameters                        = optional(list(object({
                header_parameters       = optional(map(string))
                path_parameter_values   = optional(list(string))
                query_string_parameters = optional(map(string))
            })))
            kinesis_stream_parameters              = optional(list(object({
                partition_key = string
            })))
            lambda_function_parameters             = optional(list(object({
                invocation_type = string
            })))
            redshift_data_parameters               = optional(list(object({
                database           = string
                sqls               = set(string)
                db_user            = optional(string)
                secret_manager_arn = optional(string)
                statement_name     = optional(string)
                with_event         = optional(bool)
            })))
            sagemaker_pipeline_parameters          = optional(list(object({
                pipeline_parameter = optional(list(object({
                    name  = string
                    value = string
                })))
            })))
            sqs_queue_parameters                   = optional(list(object({
                message_deduplication_id = optional(string)
                message_group_id         = optional(string)
            })))
            step_function_state_machine_parameters = optional(list(object({
                invocation_type = string
            })))
        })))
  }))
}
