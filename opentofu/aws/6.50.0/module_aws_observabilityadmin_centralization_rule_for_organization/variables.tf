variable "observabilityadmin_centralization_rule_for_organizations" {
  description = <<EOT
Map of observabilityadmin_centralization_rule_for_organizations, attributes below
Required:
    - rule_name
Optional:
    - region
    - tags
    - rule
EOT

  type = map(object({
    rule_name = string
    region    = optional(string)
    tags      = optional(map(string))
    rule      = optional(list(object({
            destination = optional(list(object({
                account                        = string
                region                         = string
                destination_logs_configuration = optional(list(object({
                    backup_configuration          = optional(list(object({
                        kms_key_arn = optional(string)
                        region      = optional(string)
                    })))
                    log_group_name_configuration  = optional(list(object({
                        log_group_name_pattern = string
                    })))
                    logs_encryption_configuration = optional(list(object({
                        encryption_strategy                     = string
                        encryption_conflict_resolution_strategy = optional(string)
                        kms_key_arn                             = optional(string)
                    })))
                })))
            })))
            source      = optional(list(object({
                regions                   = set(string)
                scope                     = string
                source_logs_configuration = optional(list(object({
                    encrypted_log_group_strategy   = string
                    data_source_selection_criteria = optional(string)
                    log_group_selection_criteria   = optional(string)
                })))
            })))
        })))
  }))
}
