resource "aws_sagemaker_algorithm" "sagemaker_algorithms" {
  for_each = var.sagemaker_algorithms

  algorithm_name          = each.value.algorithm_name
  algorithm_description   = each.value.algorithm_description
  certify_for_marketplace = each.value.certify_for_marketplace
  region                  = each.value.region
  tags                    = each.value.tags

  dynamic "inference_specification" {
    for_each = each.value.inference_specification != null ? each.value.inference_specification : []
    content {
      supported_content_types                     = inference_specification.value.supported_content_types
      supported_realtime_inference_instance_types = inference_specification.value.supported_realtime_inference_instance_types
      supported_response_mime_types               = inference_specification.value.supported_response_mime_types
      supported_transform_instance_types          = inference_specification.value.supported_transform_instance_types

      dynamic "containers" {
        for_each = inference_specification.value.containers != null ? inference_specification.value.containers : []
        content {
          container_hostname = containers.value.container_hostname
          environment        = containers.value.environment
          framework          = containers.value.framework
          framework_version  = containers.value.framework_version
          image              = containers.value.image
          image_digest       = containers.value.image_digest
          is_checkpoint      = containers.value.is_checkpoint
          model_data_etag    = containers.value.model_data_etag
          model_data_url     = containers.value.model_data_url
          nearest_model_name = containers.value.nearest_model_name
          product_id         = containers.value.product_id

          dynamic "additional_s3_data_source" {
            for_each = containers.value.additional_s3_data_source != null ? containers.value.additional_s3_data_source : []
            content {
              s3_data_type     = additional_s3_data_source.value.s3_data_type
              s3_uri           = additional_s3_data_source.value.s3_uri
              compression_type = additional_s3_data_source.value.compression_type
              etag             = additional_s3_data_source.value.etag
            }
          }

          dynamic "base_model" {
            for_each = containers.value.base_model != null ? containers.value.base_model : []
            content {
              hub_content_name    = base_model.value.hub_content_name
              hub_content_version = base_model.value.hub_content_version
              recipe_name         = base_model.value.recipe_name
            }
          }

          dynamic "model_data_source" {
            for_each = containers.value.model_data_source != null ? containers.value.model_data_source : []
            content {

              dynamic "s3_data_source" {
                for_each = model_data_source.value.s3_data_source != null ? model_data_source.value.s3_data_source : []
                content {
                  compression_type = s3_data_source.value.compression_type
                  s3_data_type     = s3_data_source.value.s3_data_type
                  s3_uri           = s3_data_source.value.s3_uri
                  etag             = s3_data_source.value.etag
                  manifest_etag    = s3_data_source.value.manifest_etag
                  manifest_s3_uri  = s3_data_source.value.manifest_s3_uri

                  dynamic "hub_access_config" {
                    for_each = s3_data_source.value.hub_access_config != null ? s3_data_source.value.hub_access_config : []
                    content {
                      hub_content_arn = hub_access_config.value.hub_content_arn
                    }
                  }

                  dynamic "model_access_config" {
                    for_each = s3_data_source.value.model_access_config != null ? s3_data_source.value.model_access_config : []
                    content {
                      accept_eula = model_access_config.value.accept_eula
                    }
                  }
                }
              }
            }
          }

          dynamic "model_input" {
            for_each = containers.value.model_input != null ? containers.value.model_input : []
            content {
              data_input_config = model_input.value.data_input_config
            }
          }
        }
      }
    }
  }

  dynamic "training_specification" {
    for_each = each.value.training_specification != null ? each.value.training_specification : []
    content {
      supported_training_instance_types = training_specification.value.supported_training_instance_types
      training_image                    = training_specification.value.training_image
      supports_distributed_training     = training_specification.value.supports_distributed_training
      training_image_digest             = training_specification.value.training_image_digest

      dynamic "additional_s3_data_source" {
        for_each = training_specification.value.additional_s3_data_source != null ? training_specification.value.additional_s3_data_source : []
        content {
          s3_data_type     = additional_s3_data_source.value.s3_data_type
          s3_uri           = additional_s3_data_source.value.s3_uri
          compression_type = additional_s3_data_source.value.compression_type
          etag             = additional_s3_data_source.value.etag
        }
      }

      dynamic "metric_definitions" {
        for_each = training_specification.value.metric_definitions != null ? training_specification.value.metric_definitions : []
        content {
          name  = metric_definitions.value.name
          regex = metric_definitions.value.regex
        }
      }

      dynamic "supported_hyper_parameters" {
        for_each = training_specification.value.supported_hyper_parameters != null ? training_specification.value.supported_hyper_parameters : []
        content {
          name          = supported_hyper_parameters.value.name
          type          = supported_hyper_parameters.value.type
          default_value = supported_hyper_parameters.value.default_value
          description   = supported_hyper_parameters.value.description
          is_required   = supported_hyper_parameters.value.is_required
          is_tunable    = supported_hyper_parameters.value.is_tunable

          dynamic "range" {
            for_each = supported_hyper_parameters.value.range != null ? supported_hyper_parameters.value.range : []
            content {

              dynamic "categorical_parameter_range_specification" {
                for_each = range.value.categorical_parameter_range_specification != null ? range.value.categorical_parameter_range_specification : []
                content {
                  values = categorical_parameter_range_specification.value.values
                }
              }

              dynamic "continuous_parameter_range_specification" {
                for_each = range.value.continuous_parameter_range_specification != null ? range.value.continuous_parameter_range_specification : []
                content {
                  max_value = continuous_parameter_range_specification.value.max_value
                  min_value = continuous_parameter_range_specification.value.min_value
                }
              }

              dynamic "integer_parameter_range_specification" {
                for_each = range.value.integer_parameter_range_specification != null ? range.value.integer_parameter_range_specification : []
                content {
                  max_value = integer_parameter_range_specification.value.max_value
                  min_value = integer_parameter_range_specification.value.min_value
                }
              }
            }
          }
        }
      }

      dynamic "supported_tuning_job_objective_metrics" {
        for_each = training_specification.value.supported_tuning_job_objective_metrics != null ? training_specification.value.supported_tuning_job_objective_metrics : []
        content {
          metric_name = supported_tuning_job_objective_metrics.value.metric_name
          type        = supported_tuning_job_objective_metrics.value.type
        }
      }

      dynamic "training_channels" {
        for_each = training_specification.value.training_channels != null ? training_specification.value.training_channels : []
        content {
          name                        = training_channels.value.name
          supported_content_types     = training_channels.value.supported_content_types
          supported_input_modes       = training_channels.value.supported_input_modes
          description                 = training_channels.value.description
          is_required                 = training_channels.value.is_required
          supported_compression_types = training_channels.value.supported_compression_types
        }
      }
    }
  }

  dynamic "validation_specification" {
    for_each = each.value.validation_specification != null ? each.value.validation_specification : []
    content {
      validation_role = validation_specification.value.validation_role

      dynamic "validation_profiles" {
        for_each = validation_specification.value.validation_profiles != null ? validation_specification.value.validation_profiles : []
        content {
          profile_name = validation_profiles.value.profile_name

          dynamic "training_job_definition" {
            for_each = validation_profiles.value.training_job_definition != null ? validation_profiles.value.training_job_definition : []
            content {
              training_input_mode = training_job_definition.value.training_input_mode
              hyper_parameters    = training_job_definition.value.hyper_parameters

              dynamic "input_data_config" {
                for_each = training_job_definition.value.input_data_config != null ? training_job_definition.value.input_data_config : []
                content {
                  channel_name        = input_data_config.value.channel_name
                  compression_type    = input_data_config.value.compression_type
                  content_type        = input_data_config.value.content_type
                  input_mode          = input_data_config.value.input_mode
                  record_wrapper_type = input_data_config.value.record_wrapper_type

                  dynamic "data_source" {
                    for_each = input_data_config.value.data_source != null ? input_data_config.value.data_source : []
                    content {

                      dynamic "file_system_data_source" {
                        for_each = data_source.value.file_system_data_source != null ? data_source.value.file_system_data_source : []
                        content {
                          directory_path          = file_system_data_source.value.directory_path
                          file_system_access_mode = file_system_data_source.value.file_system_access_mode
                          file_system_id          = file_system_data_source.value.file_system_id
                          file_system_type        = file_system_data_source.value.file_system_type
                        }
                      }

                      dynamic "s3_data_source" {
                        for_each = data_source.value.s3_data_source != null ? data_source.value.s3_data_source : []
                        content {
                          s3_data_type              = s3_data_source.value.s3_data_type
                          s3_uri                    = s3_data_source.value.s3_uri
                          attribute_names           = s3_data_source.value.attribute_names
                          instance_group_names      = s3_data_source.value.instance_group_names
                          s3_data_distribution_type = s3_data_source.value.s3_data_distribution_type

                          dynamic "hub_access_config" {
                            for_each = s3_data_source.value.hub_access_config != null ? s3_data_source.value.hub_access_config : []
                            content {
                              hub_content_arn = hub_access_config.value.hub_content_arn
                            }
                          }

                          dynamic "model_access_config" {
                            for_each = s3_data_source.value.model_access_config != null ? s3_data_source.value.model_access_config : []
                            content {
                              accept_eula = model_access_config.value.accept_eula
                            }
                          }
                        }
                      }
                    }
                  }

                  dynamic "shuffle_config" {
                    for_each = input_data_config.value.shuffle_config != null ? input_data_config.value.shuffle_config : []
                    content {
                      seed = shuffle_config.value.seed
                    }
                  }
                }
              }

              dynamic "output_data_config" {
                for_each = training_job_definition.value.output_data_config != null ? training_job_definition.value.output_data_config : []
                content {
                  s3_output_path   = output_data_config.value.s3_output_path
                  compression_type = output_data_config.value.compression_type
                  kms_key_id       = output_data_config.value.kms_key_id
                }
              }

              dynamic "resource_config" {
                for_each = training_job_definition.value.resource_config != null ? training_job_definition.value.resource_config : []
                content {
                  instance_count               = resource_config.value.instance_count
                  instance_type                = resource_config.value.instance_type
                  keep_alive_period_in_seconds = resource_config.value.keep_alive_period_in_seconds
                  training_plan_arn            = resource_config.value.training_plan_arn
                  volume_kms_key_id            = resource_config.value.volume_kms_key_id
                  volume_size_in_gb            = resource_config.value.volume_size_in_gb

                  dynamic "instance_groups" {
                    for_each = resource_config.value.instance_groups != null ? resource_config.value.instance_groups : []
                    content {
                      instance_count      = instance_groups.value.instance_count
                      instance_group_name = instance_groups.value.instance_group_name
                      instance_type       = instance_groups.value.instance_type
                    }
                  }

                  dynamic "instance_placement_config" {
                    for_each = resource_config.value.instance_placement_config != null ? resource_config.value.instance_placement_config : []
                    content {
                      enable_multiple_jobs = instance_placement_config.value.enable_multiple_jobs

                      dynamic "placement_specifications" {
                        for_each = instance_placement_config.value.placement_specifications != null ? instance_placement_config.value.placement_specifications : []
                        content {
                          instance_count  = placement_specifications.value.instance_count
                          ultra_server_id = placement_specifications.value.ultra_server_id
                        }
                      }
                    }
                  }
                }
              }

              dynamic "stopping_condition" {
                for_each = training_job_definition.value.stopping_condition != null ? training_job_definition.value.stopping_condition : []
                content {
                  max_pending_time_in_seconds = stopping_condition.value.max_pending_time_in_seconds
                  max_runtime_in_seconds      = stopping_condition.value.max_runtime_in_seconds
                  max_wait_time_in_seconds    = stopping_condition.value.max_wait_time_in_seconds
                }
              }
            }
          }

          dynamic "transform_job_definition" {
            for_each = validation_profiles.value.transform_job_definition != null ? validation_profiles.value.transform_job_definition : []
            content {
              batch_strategy            = transform_job_definition.value.batch_strategy
              environment               = transform_job_definition.value.environment
              max_concurrent_transforms = transform_job_definition.value.max_concurrent_transforms
              max_payload_in_mb         = transform_job_definition.value.max_payload_in_mb

              dynamic "transform_input" {
                for_each = transform_job_definition.value.transform_input != null ? transform_job_definition.value.transform_input : []
                content {
                  compression_type = transform_input.value.compression_type
                  content_type     = transform_input.value.content_type
                  split_type       = transform_input.value.split_type

                  dynamic "data_source" {
                    for_each = transform_input.value.data_source != null ? transform_input.value.data_source : []
                    content {

                      dynamic "s3_data_source" {
                        for_each = data_source.value.s3_data_source != null ? data_source.value.s3_data_source : []
                        content {
                          s3_data_type = s3_data_source.value.s3_data_type
                          s3_uri       = s3_data_source.value.s3_uri
                        }
                      }
                    }
                  }
                }
              }

              dynamic "transform_output" {
                for_each = transform_job_definition.value.transform_output != null ? transform_job_definition.value.transform_output : []
                content {
                  s3_output_path = transform_output.value.s3_output_path
                  accept         = transform_output.value.accept
                  assemble_with  = transform_output.value.assemble_with
                  kms_key_id     = transform_output.value.kms_key_id
                }
              }

              dynamic "transform_resources" {
                for_each = transform_job_definition.value.transform_resources != null ? transform_job_definition.value.transform_resources : []
                content {
                  instance_count        = transform_resources.value.instance_count
                  instance_type         = transform_resources.value.instance_type
                  transform_ami_version = transform_resources.value.transform_ami_version
                  volume_kms_key_id     = transform_resources.value.volume_kms_key_id
                }
              }
            }
          }
        }
      }
    }
  }
}
