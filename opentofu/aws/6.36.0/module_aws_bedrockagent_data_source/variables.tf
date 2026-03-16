variable "bedrockagent_data_sources" {
  description = <<EOT
Map of bedrockagent_data_sources, attributes below
Required:
    - knowledge_base_id
    - name
Optional:
    - data_deletion_policy
    - description
    - region
    - data_source_configuration
    - server_side_encryption_configuration
    - vector_ingestion_configuration
EOT

  type = map(object({
    knowledge_base_id                    = string
    name                                 = string
    data_deletion_policy                 = optional(string)
    description                          = optional(string)
    region                               = optional(string)
    data_source_configuration            = optional(list(object({
            type                      = string
            confluence_configuration  = optional(list(object({
                crawler_configuration = optional(list(object({
                    filter_configuration = optional(list(object({
                        type                  = string
                        pattern_object_filter = optional(list(object({
                            filters = optional(list(object({
                                object_type       = string
                                exclusion_filters = optional(set(string))
                                inclusion_filters = optional(set(string))
                            })))
                        })))
                    })))
                })))
                source_configuration  = optional(list(object({
                    auth_type              = string
                    credentials_secret_arn = string
                    host_type              = string
                    host_url               = string
                })))
            })))
            s3_configuration          = optional(list(object({
                bucket_arn              = string
                bucket_owner_account_id = optional(string)
                inclusion_prefixes      = optional(set(string))
            })))
            salesforce_configuration  = optional(list(object({
                crawler_configuration = optional(list(object({
                    filter_configuration = optional(list(object({
                        type                  = string
                        pattern_object_filter = optional(list(object({
                            filters = optional(list(object({
                                object_type       = string
                                exclusion_filters = optional(set(string))
                                inclusion_filters = optional(set(string))
                            })))
                        })))
                    })))
                })))
                source_configuration  = optional(list(object({
                    auth_type              = string
                    credentials_secret_arn = string
                    host_url               = string
                })))
            })))
            share_point_configuration = optional(list(object({
                crawler_configuration = optional(list(object({
                    filter_configuration = optional(list(object({
                        type                  = string
                        pattern_object_filter = optional(list(object({
                            filters = optional(list(object({
                                object_type       = string
                                exclusion_filters = optional(set(string))
                                inclusion_filters = optional(set(string))
                            })))
                        })))
                    })))
                })))
                source_configuration  = optional(list(object({
                    auth_type              = string
                    credentials_secret_arn = string
                    domain                 = string
                    host_type              = string
                    site_urls              = set(string)
                    tenant_id              = optional(string)
                })))
            })))
            web_configuration         = optional(list(object({
                crawler_configuration = optional(list(object({
                    exclusion_filters = optional(set(string))
                    inclusion_filters = optional(set(string))
                    scope             = optional(string)
                    user_agent        = optional(string)
                    crawler_limits    = optional(list(object({
                        max_pages  = optional(number)
                        rate_limit = optional(number)
                    })))
                })))
                source_configuration  = optional(list(object({
                    url_configuration = optional(list(object({
                        seed_urls = optional(list(object({
                            url = optional(string)
                        })))
                    })))
                })))
            })))
        })))
    server_side_encryption_configuration = optional(list(object({
            kms_key_arn = optional(string)
        })))
    vector_ingestion_configuration       = optional(list(object({
            chunking_configuration              = optional(list(object({
                chunking_strategy                   = string
                fixed_size_chunking_configuration   = optional(list(object({
                    max_tokens         = number
                    overlap_percentage = number
                })))
                hierarchical_chunking_configuration = optional(list(object({
                    overlap_tokens      = number
                    level_configuration = optional(list(object({
                        max_tokens = number
                    })))
                })))
                semantic_chunking_configuration     = optional(list(object({
                    breakpoint_percentile_threshold = number
                    buffer_size                     = number
                    max_token                       = number
                })))
            })))
            custom_transformation_configuration = optional(list(object({
                intermediate_storage = optional(list(object({
                    s3_location = optional(list(object({
                        uri = string
                    })))
                })))
                transformation       = optional(list(object({
                    step_to_apply           = string
                    transformation_function = optional(list(object({
                        transformation_lambda_configuration = optional(list(object({
                            lambda_arn = string
                        })))
                    })))
                })))
            })))
            parsing_configuration               = optional(list(object({
                parsing_strategy                       = string
                bedrock_data_automation_configuration  = optional(list(object({
                    parsing_modality = optional(string)
                })))
                bedrock_foundation_model_configuration = optional(list(object({
                    model_arn        = string
                    parsing_modality = optional(string)
                    parsing_prompt   = optional(list(object({
                        parsing_prompt_string = string
                    })))
                })))
            })))
        })))
  }))
}
