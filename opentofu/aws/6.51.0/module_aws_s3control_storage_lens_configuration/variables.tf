variable "s3control_storage_lens_configurations" {
  description = <<EOT
Map of s3control_storage_lens_configurations, attributes below
Required:
    - config_id
    - storage_lens_configuration
Optional:
    - account_id
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    config_id                  = string
    account_id                 = optional(string)
    region                     = optional(string)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
    storage_lens_configuration = list(object({
            enabled                       = bool
            prefix_delimiter              = optional(string)
            account_level                 = list(object({
                activity_metrics                   = optional(list(object({
                    enabled = optional(bool)
                })))
                advanced_cost_optimization_metrics = optional(list(object({
                    enabled = optional(bool)
                })))
                advanced_data_protection_metrics   = optional(list(object({
                    enabled = optional(bool)
                })))
                advanced_performance_metrics       = optional(list(object({
                    enabled = optional(bool)
                })))
                bucket_level                       = list(object({
                    activity_metrics                   = optional(list(object({
                        enabled = optional(bool)
                    })))
                    advanced_cost_optimization_metrics = optional(list(object({
                        enabled = optional(bool)
                    })))
                    advanced_data_protection_metrics   = optional(list(object({
                        enabled = optional(bool)
                    })))
                    advanced_performance_metrics       = optional(list(object({
                        enabled = optional(bool)
                    })))
                    detailed_status_code_metrics       = optional(list(object({
                        enabled = optional(bool)
                    })))
                    prefix_level                       = optional(list(object({
                        storage_metrics = list(object({
                            enabled            = optional(bool)
                            selection_criteria = optional(list(object({
                                delimiter                    = optional(string)
                                max_depth                    = optional(number)
                                min_storage_bytes_percentage = optional(number)
                            })))
                        }))
                    })))
                }))
                detailed_status_code_metrics       = optional(list(object({
                    enabled = optional(bool)
                })))
            }))
            aws_org                       = optional(list(object({
                arn = string
            })))
            data_export                   = optional(list(object({
                cloud_watch_metrics            = optional(list(object({
                    enabled = bool
                })))
                s3_bucket_destination          = optional(list(object({
                    account_id            = string
                    arn                   = string
                    format                = string
                    output_schema_version = string
                    prefix                = optional(string)
                    encryption            = optional(list(object({
                        sse_kms = optional(list(object({
                            key_id = string
                        })))
                        sse_s3  = optional(list(object({

                        })))
                    })))
                })))
                storage_lens_table_destination = optional(list(object({
                    enabled    = bool
                    encryption = optional(list(object({
                        sse_kms = optional(list(object({
                            key_id = string
                        })))
                        sse_s3  = optional(list(object({

                        })))
                    })))
                })))
            })))
            exclude                       = optional(list(object({
                buckets = optional(set(string))
                regions = optional(set(string))
            })))
            expanded_prefixes_data_export = optional(list(object({
                s3_bucket_destination          = optional(list(object({
                    account_id            = string
                    arn                   = string
                    format                = string
                    output_schema_version = string
                    prefix                = optional(string)
                    encryption            = optional(list(object({
                        sse_kms = optional(list(object({
                            key_id = string
                        })))
                        sse_s3  = optional(list(object({

                        })))
                    })))
                })))
                storage_lens_table_destination = optional(list(object({
                    enabled    = bool
                    encryption = optional(list(object({
                        sse_kms = optional(list(object({
                            key_id = string
                        })))
                        sse_s3  = optional(list(object({

                        })))
                    })))
                })))
            })))
            include                       = optional(list(object({
                buckets = optional(set(string))
                regions = optional(set(string))
            })))
        }))
  }))
}
