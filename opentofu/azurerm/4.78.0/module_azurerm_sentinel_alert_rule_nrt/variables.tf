variable "sentinel_alert_rule_nrts" {
  description = <<EOT
Map of sentinel_alert_rule_nrts, attributes below
Required:
    - display_name
    - log_analytics_workspace_id
    - name
    - query
    - severity
    - event_grouping
Optional:
    - alert_rule_template_guid
    - alert_rule_template_version
    - custom_details
    - description
    - enabled
    - suppression_duration
    - suppression_enabled
    - tactics
    - techniques
    - alert_details_override
    - entity_mapping
    - incident
    - sentinel_entity_mapping
EOT

  type = map(object({
    display_name                = string
    log_analytics_workspace_id  = string
    name                        = string
    query                       = string
    severity                    = string
    alert_rule_template_guid    = optional(string)
    alert_rule_template_version = optional(string)
    custom_details              = optional(map(string))
    description                 = optional(string)
    enabled                     = optional(bool)
    suppression_duration        = optional(string)
    suppression_enabled         = optional(bool)
    tactics                     = optional(set(string))
    techniques                  = optional(set(string))
    alert_details_override      = optional(list(object({
            description_format   = optional(string)
            display_name_format  = optional(string)
            severity_column_name = optional(string)
            tactics_column_name  = optional(string)
            dynamic_property     = optional(list(object({
                name  = string
                value = string
            })))
        })))
    entity_mapping              = optional(list(object({
            entity_type   = string
            field_mapping = list(object({
                column_name = string
                identifier  = string
            }))
        })))
    event_grouping              = list(object({
            aggregation_method = string
        }))
    incident                    = optional(list(object({
            create_incident_enabled = bool
            grouping                = list(object({
                by_alert_details        = optional(list(string))
                by_custom_details       = optional(list(string))
                by_entities             = optional(list(string))
                enabled                 = optional(bool)
                entity_matching_method  = optional(string)
                lookback_duration       = optional(string)
                reopen_closed_incidents = optional(bool)
            }))
        })))
    sentinel_entity_mapping     = optional(list(object({
            column_name = string
        })))
  }))
}
