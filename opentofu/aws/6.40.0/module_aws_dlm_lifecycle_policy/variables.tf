variable "dlm_lifecycle_policies" {
  description = <<EOT
Map of dlm_lifecycle_policies, attributes below
Required:
    - description
    - execution_role_arn
    - policy_details
Optional:
    - default_policy
    - region
    - state
    - tags
    - tags_all
EOT

  type = map(object({
    description        = string
    execution_role_arn = string
    default_policy     = optional(string)
    region             = optional(string)
    state              = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    policy_details     = list(object({
            copy_tags          = optional(bool)
            create_interval    = optional(number)
            extend_deletion    = optional(bool)
            policy_language    = optional(string)
            policy_type        = optional(string)
            resource_locations = optional(list(string))
            resource_type      = optional(string)
            resource_types     = optional(list(string))
            retain_interval    = optional(number)
            target_tags        = optional(map(string))
            action             = optional(list(object({
                name              = string
                cross_region_copy = set(object({
                    target                   = string
                    encryption_configuration = list(object({
                        cmk_arn   = optional(string)
                        encrypted = optional(bool)
                    }))
                    retain_rule              = optional(list(object({
                        interval      = number
                        interval_unit = string
                    })))
                }))
            })))
            event_source       = optional(list(object({
                type       = string
                parameters = list(object({
                    description_regex = string
                    event_type        = string
                    snapshot_owner    = set(string)
                }))
            })))
            exclusions         = optional(list(object({
                exclude_boot_volumes = optional(bool)
                exclude_tags         = optional(map(string))
                exclude_volume_types = optional(list(string))
            })))
            parameters         = optional(list(object({
                exclude_boot_volume = optional(bool)
                no_reboot           = optional(bool)
            })))
            schedule           = optional(list(object({
                name                   = string
                copy_tags              = optional(bool)
                tags_to_add            = optional(map(string))
                variable_tags          = optional(map(string))
                archive_rule           = optional(list(object({
                    archive_retain_rule = list(object({
                        retention_archive_tier = list(object({
                            count         = optional(number)
                            interval      = optional(number)
                            interval_unit = optional(string)
                        }))
                    }))
                })))
                create_rule            = list(object({
                    cron_expression = optional(string)
                    interval        = optional(number)
                    interval_unit   = optional(string)
                    location        = optional(string)
                    times           = optional(list(string))
                    scripts         = optional(list(object({
                        execution_handler                   = string
                        execute_operation_on_script_failure = optional(bool)
                        execution_handler_service           = optional(string)
                        execution_timeout                   = optional(number)
                        maximum_retry_count                 = optional(number)
                        stages                              = optional(list(string))
                    })))
                }))
                cross_region_copy_rule = optional(set(object({
                    encrypted      = bool
                    cmk_arn        = optional(string)
                    copy_tags      = optional(bool)
                    target         = optional(string)
                    target_region  = optional(string)
                    deprecate_rule = optional(list(object({
                        interval      = number
                        interval_unit = string
                    })))
                    retain_rule    = optional(list(object({
                        interval      = number
                        interval_unit = string
                    })))
                })))
                deprecate_rule         = optional(list(object({
                    count         = optional(number)
                    interval      = optional(number)
                    interval_unit = optional(string)
                })))
                fast_restore_rule      = optional(list(object({
                    availability_zones = set(string)
                    count              = optional(number)
                    interval           = optional(number)
                    interval_unit      = optional(string)
                })))
                retain_rule            = list(object({
                    count         = optional(number)
                    interval      = optional(number)
                    interval_unit = optional(string)
                }))
                share_rule             = optional(list(object({
                    target_accounts       = set(string)
                    unshare_interval      = optional(number)
                    unshare_interval_unit = optional(string)
                })))
            })))
        }))
  }))
}
