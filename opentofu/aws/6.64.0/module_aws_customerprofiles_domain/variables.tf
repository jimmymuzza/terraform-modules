variable "customerprofiles_domains" {
  description = <<EOT
Map of customerprofiles_domains, attributes below
Required:
    - default_expiration_days
    - domain_name
Optional:
    - dead_letter_queue_url
    - default_encryption_key
    - region
    - tags
    - tags_all
    - matching
    - rule_based_matching
EOT

  type = map(object({
    default_expiration_days = number
    domain_name             = string
    dead_letter_queue_url   = optional(string)
    default_encryption_key  = optional(string)
    region                  = optional(string)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
    matching                = optional(list(object({
            enabled          = bool
            auto_merging     = optional(list(object({
                enabled                                  = bool
                min_allowed_confidence_score_for_merging = optional(number)
                conflict_resolution                      = optional(list(object({
                    conflict_resolving_model = string
                    source_name              = optional(string)
                })))
                consolidation                            = optional(list(object({
                    matching_attributes_list = list(list(string))
                })))
            })))
            exporting_config = optional(list(object({
                s3_exporting = optional(list(object({
                    s3_bucket_name = string
                    s3_key_name    = optional(string)
                })))
            })))
            job_schedule     = optional(list(object({
                day_of_the_week = string
                time            = string
            })))
        })))
    rule_based_matching     = optional(list(object({
            enabled                             = bool
            max_allowed_rule_level_for_matching = optional(number)
            max_allowed_rule_level_for_merging  = optional(number)
            status                              = optional(string)
            attribute_types_selector            = optional(list(object({
                attribute_matching_model = string
                address                  = optional(list(string))
                email_address            = optional(list(string))
                phone_number             = optional(list(string))
            })))
            conflict_resolution                 = optional(list(object({
                conflict_resolving_model = string
                source_name              = optional(string)
            })))
            exporting_config                    = optional(list(object({
                s3_exporting = optional(list(object({
                    s3_bucket_name = string
                    s3_key_name    = optional(string)
                })))
            })))
            matching_rules                      = optional(set(object({
                rule = list(string)
            })))
        })))
  }))
}
