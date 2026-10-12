variable "kendra_data_sources" {
  description = <<EOT
Map of kendra_data_sources, attributes below
Required:
    - index_id
    - name
    - type
Optional:
    - description
    - language_code
    - region
    - role_arn
    - schedule
    - tags
    - tags_all
    - configuration
    - custom_document_enrichment_configuration
EOT

  type = map(object({
    index_id                                 = string
    name                                     = string
    type                                     = string
    description                              = optional(string)
    language_code                            = optional(string)
    region                                   = optional(string)
    role_arn                                 = optional(string)
    schedule                                 = optional(string)
    tags                                     = optional(map(string))
    tags_all                                 = optional(map(string))
    configuration                            = optional(list(object({
            s3_configuration          = optional(list(object({
                bucket_name                       = string
                exclusion_patterns                = optional(set(string))
                inclusion_patterns                = optional(set(string))
                inclusion_prefixes                = optional(set(string))
                access_control_list_configuration = optional(list(object({
                    key_path = optional(string)
                })))
                documents_metadata_configuration  = optional(list(object({
                    s3_prefix = optional(string)
                })))
            })))
            template_configuration    = optional(list(object({
                template = string
            })))
            web_crawler_configuration = optional(list(object({
                crawl_depth                             = optional(number)
                max_content_size_per_page_in_mega_bytes = optional(number)
                max_links_per_page                      = optional(number)
                max_urls_per_minute_crawl_rate          = optional(number)
                url_exclusion_patterns                  = optional(set(string))
                url_inclusion_patterns                  = optional(set(string))
                authentication_configuration            = optional(list(object({
                    basic_authentication = optional(set(object({
                        credentials = string
                        host        = string
                        port        = number
                    })))
                })))
                proxy_configuration                     = optional(list(object({
                    host        = string
                    port        = number
                    credentials = optional(string)
                })))
                urls                                    = list(object({
                    seed_url_configuration  = optional(list(object({
                        seed_urls        = set(string)
                        web_crawler_mode = optional(string)
                    })))
                    site_maps_configuration = optional(list(object({
                        site_maps = set(string)
                    })))
                }))
            })))
        })))
    custom_document_enrichment_configuration = optional(list(object({
            role_arn                           = optional(string)
            inline_configurations              = optional(set(object({
                document_content_deletion = optional(bool)
                condition                 = optional(list(object({
                    condition_document_attribute_key = string
                    operator                         = string
                    condition_on_value               = optional(list(object({
                        date_value        = optional(string)
                        long_value        = optional(number)
                        string_list_value = optional(set(string))
                        string_value      = optional(string)
                    })))
                })))
                target                    = optional(list(object({
                    target_document_attribute_key            = optional(string)
                    target_document_attribute_value_deletion = optional(bool)
                    target_document_attribute_value          = optional(list(object({
                        date_value        = optional(string)
                        long_value        = optional(number)
                        string_list_value = optional(set(string))
                        string_value      = optional(string)
                    })))
                })))
            })))
            post_extraction_hook_configuration = optional(list(object({
                lambda_arn           = string
                s3_bucket            = string
                invocation_condition = optional(list(object({
                    condition_document_attribute_key = string
                    operator                         = string
                    condition_on_value               = optional(list(object({
                        date_value        = optional(string)
                        long_value        = optional(number)
                        string_list_value = optional(set(string))
                        string_value      = optional(string)
                    })))
                })))
            })))
            pre_extraction_hook_configuration  = optional(list(object({
                lambda_arn           = string
                s3_bucket            = string
                invocation_condition = optional(list(object({
                    condition_document_attribute_key = string
                    operator                         = string
                    condition_on_value               = optional(list(object({
                        date_value        = optional(string)
                        long_value        = optional(number)
                        string_list_value = optional(set(string))
                        string_value      = optional(string)
                    })))
                })))
            })))
        })))
  }))
}
