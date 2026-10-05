variable "sentinel_alert_rule_scheduleds" {
  description = <<EOT
Map of sentinel_alert_rule_scheduleds, attributes below
Required:
    - display_name
    - log_analytics_workspace_id
    - name
    - query
    - severity
Optional:
    - alert_rule_template_guid
    - alert_rule_template_version
    - custom_details
    - description
    - enabled
    - query_frequency
    - query_period
    - suppression_duration
    - suppression_enabled
    - tactics
    - techniques
    - trigger_operator
    - trigger_threshold
    - alert_details_override
    - entity_mapping
    - event_grouping
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
    query_frequency             = optional(string)
    query_period                = optional(string)
    suppression_duration        = optional(string)
    suppression_enabled         = optional(bool)
    tactics                     = optional(set(string))
    techniques                  = optional(set(string))
    trigger_operator            = optional(string)
    trigger_threshold           = optional(number)
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
    event_grouping              = optional(list(object({
            aggregation_method = string
        })))
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
