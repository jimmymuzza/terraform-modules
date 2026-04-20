variable "macie2_classification_jobs" {
  description = <<EOT
Map of macie2_classification_jobs, attributes below
Required:
    - job_type
    - s3_job_definition
Optional:
    - custom_data_identifier_ids
    - description
    - initial_run
    - job_status
    - name
    - name_prefix
    - region
    - sampling_percentage
    - tags
    - tags_all
    - schedule_frequency
EOT

  type = map(object({
    job_type                   = string
    custom_data_identifier_ids = optional(list(string))
    description                = optional(string)
    initial_run                = optional(bool)
    job_status                 = optional(string)
    name                       = optional(string)
    name_prefix                = optional(string)
    region                     = optional(string)
    sampling_percentage        = optional(number)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
    s3_job_definition          = list(object({
            bucket_criteria    = optional(list(object({
                excludes = optional(list(object({
                    and = optional(list(object({
                        simple_criterion = optional(list(object({
                            comparator = optional(string)
                            key        = optional(string)
                            values     = optional(list(string))
                        })))
                        tag_criterion    = optional(list(object({
                            comparator = optional(string)
                            tag_values = optional(list(object({
                                key   = optional(string)
                                value = optional(string)
                            })))
                        })))
                    })))
                })))
                includes = optional(list(object({
                    and = optional(list(object({
                        simple_criterion = optional(list(object({
                            comparator = optional(string)
                            key        = optional(string)
                            values     = optional(list(string))
                        })))
                        tag_criterion    = optional(list(object({
                            comparator = optional(string)
                            tag_values = optional(list(object({
                                key   = optional(string)
                                value = optional(string)
                            })))
                        })))
                    })))
                })))
            })))
            bucket_definitions = optional(list(object({
                account_id = string
                buckets    = list(string)
            })))
            scoping            = optional(list(object({
                excludes = optional(list(object({
                    and = optional(list(object({
                        simple_scope_term = optional(list(object({
                            comparator = optional(string)
                            key        = optional(string)
                            values     = optional(list(string))
                        })))
                        tag_scope_term    = optional(list(object({
                            comparator = optional(string)
                            key        = optional(string)
                            target     = optional(string)
                            tag_values = optional(list(object({
                                key   = optional(string)
                                value = optional(string)
                            })))
                        })))
                    })))
                })))
                includes = optional(list(object({
                    and = optional(list(object({
                        simple_scope_term = optional(list(object({
                            comparator = optional(string)
                            key        = optional(string)
                            values     = optional(list(string))
                        })))
                        tag_scope_term    = optional(list(object({
                            comparator = optional(string)
                            key        = optional(string)
                            target     = optional(string)
                            tag_values = optional(list(object({
                                key   = optional(string)
                                value = optional(string)
                            })))
                        })))
                    })))
                })))
            })))
        }))
    schedule_frequency         = optional(list(object({
            daily_schedule   = optional(bool)
            monthly_schedule = optional(number)
            weekly_schedule  = optional(string)
        })))
  }))
}
