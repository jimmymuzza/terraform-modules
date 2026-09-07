variable "bedrock_evaluation_jobs" {
  description = <<EOT
Map of bedrock_evaluation_jobs, attributes below
Required:
    - job_name
    - role_arn
Optional:
    - application_type
    - customer_encryption_key_id
    - job_description
    - region
    - skip_destroy
    - tags
    - evaluation_config
    - inference_config
    - output_data_config
EOT

  type = map(object({
    job_name                   = string
    role_arn                   = string
    application_type           = optional(string)
    customer_encryption_key_id = optional(string)
    job_description            = optional(string)
    region                     = optional(string)
    skip_destroy               = optional(bool)
    tags                       = optional(map(string))
    evaluation_config          = optional(list(object({
            automated = optional(list(object({
                custom_metric_config   = optional(list(object({
                    custom_metric          = optional(list(object({
                        custom_metric_definition = optional(list(object({
                            instructions = string
                            name         = string
                            rating_scale = optional(list(object({
                                definition = string
                                value      = optional(list(object({
                                    float_value  = optional(number)
                                    string_value = optional(string)
                                })))
                            })))
                        })))
                    })))
                    evaluator_model_config = optional(list(object({
                        bedrock_evaluator_model = optional(list(object({
                            model_identifier = string
                        })))
                    })))
                })))
                dataset_metric_config  = optional(list(object({
                    metric_names = list(string)
                    task_type    = string
                    dataset      = optional(list(object({
                        name             = string
                        dataset_location = optional(list(object({
                            s3_uri = string
                        })))
                    })))
                })))
                evaluator_model_config = optional(list(object({
                    bedrock_evaluator_model = optional(list(object({
                        model_identifier = string
                    })))
                })))
            })))
            human     = optional(list(object({
                custom_metric         = optional(list(object({
                    name          = string
                    rating_method = string
                    description   = optional(string)
                })))
                dataset_metric_config = optional(list(object({
                    metric_names = list(string)
                    task_type    = string
                    dataset      = optional(list(object({
                        name             = string
                        dataset_location = optional(list(object({
                            s3_uri = string
                        })))
                    })))
                })))
                human_workflow_config = optional(list(object({
                    flow_definition_arn = string
                    instructions        = optional(string)
                })))
            })))
        })))
    inference_config           = optional(list(object({
            model      = optional(list(object({
                bedrock_model                = optional(list(object({
                    model_identifier   = string
                    inference_params   = optional(string)
                    performance_config = optional(list(object({
                        latency = optional(string)
                    })))
                })))
                precomputed_inference_source = optional(list(object({
                    inference_source_identifier = string
                })))
            })))
            rag_config = optional(list(object({
                knowledge_base_config         = optional(list(object({
                    retrieve_and_generate_config = optional(list(object({
                        knowledge_base_id       = string
                        model_arn               = string
                        retrieval_configuration = optional(list(object({
                            vector_search_configuration = optional(list(object({
                                number_of_results = optional(number)
                            })))
                        })))
                    })))
                    retrieve_config              = optional(list(object({
                        knowledge_base_id                      = string
                        knowledge_base_retrieval_configuration = optional(list(object({
                            vector_search_configuration = optional(list(object({
                                number_of_results = optional(number)
                            })))
                        })))
                    })))
                })))
                precomputed_rag_source_config = optional(list(object({
                    retrieve_and_generate_source_config = optional(list(object({
                        rag_source_identifier = string
                    })))
                    retrieve_source_config              = optional(list(object({
                        rag_source_identifier = string
                    })))
                })))
            })))
        })))
    output_data_config         = optional(list(object({
            s3_uri = string
        })))
  }))
}
