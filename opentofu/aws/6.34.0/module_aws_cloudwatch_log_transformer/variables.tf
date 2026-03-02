variable "cloudwatch_log_transformers" {
  description = <<EOT
Map of cloudwatch_log_transformers, attributes below
Required:
    - log_group_arn
Optional:
    - region
    - transformer_config
EOT

  type = map(object({
    log_group_arn      = string
    region             = optional(string)
    transformer_config = optional(list(object({
            add_keys            = optional(list(object({
                entry = optional(list(object({
                    key                 = string
                    value               = string
                    overwrite_if_exists = optional(bool)
                })))
            })))
            copy_value          = optional(list(object({
                entry = optional(list(object({
                    source              = string
                    target              = string
                    overwrite_if_exists = optional(bool)
                })))
            })))
            csv                 = optional(list(object({
                columns         = optional(list(string))
                delimiter       = optional(string)
                quote_character = optional(string)
                source          = optional(string)
            })))
            date_time_converter = optional(list(object({
                match_patterns  = list(string)
                source          = string
                target          = string
                locale          = optional(string)
                source_timezone = optional(string)
                target_format   = optional(string)
                target_timezone = optional(string)
            })))
            delete_keys         = optional(list(object({
                with_keys = list(string)
            })))
            grok                = optional(list(object({
                match  = string
                source = optional(string)
            })))
            list_to_map         = optional(list(object({
                key               = string
                source            = string
                flatten           = optional(bool)
                flattened_element = optional(string)
                target            = optional(string)
                value_key         = optional(string)
            })))
            lower_case_string   = optional(list(object({
                with_keys = list(string)
            })))
            move_keys           = optional(list(object({
                entry = optional(list(object({
                    source              = string
                    target              = string
                    overwrite_if_exists = optional(bool)
                })))
            })))
            parse_cloudfront    = optional(list(object({
                source = optional(string)
            })))
            parse_json          = optional(list(object({
                destination = optional(string)
                source      = optional(string)
            })))
            parse_key_value     = optional(list(object({
                destination         = optional(string)
                field_delimiter     = optional(string)
                key_prefix          = optional(string)
                key_value_delimiter = optional(string)
                non_match_value     = optional(string)
                overwrite_if_exists = optional(bool)
                source              = optional(string)
            })))
            parse_postgres      = optional(list(object({
                source = optional(string)
            })))
            parse_route53       = optional(list(object({
                source = optional(string)
            })))
            parse_to_ocsf       = optional(list(object({
                event_source = string
                ocsf_version = string
                source       = optional(string)
            })))
            parse_vpc           = optional(list(object({
                source = optional(string)
            })))
            parse_waf           = optional(list(object({
                source = optional(string)
            })))
            rename_keys         = optional(list(object({
                entry = optional(list(object({
                    key                 = string
                    rename_to           = string
                    overwrite_if_exists = optional(bool)
                })))
            })))
            split_string        = optional(list(object({
                entry = optional(list(object({
                    delimiter = string
                    source    = string
                })))
            })))
            substitute_string   = optional(list(object({
                entry = optional(list(object({
                    from   = string
                    source = string
                    to     = string
                })))
            })))
            trim_string         = optional(list(object({
                with_keys = list(string)
            })))
            type_converter      = optional(list(object({
                entry = optional(list(object({
                    key  = string
                    type = string
                })))
            })))
            upper_case_string   = optional(list(object({
                with_keys = list(string)
            })))
        })))
  }))
}
