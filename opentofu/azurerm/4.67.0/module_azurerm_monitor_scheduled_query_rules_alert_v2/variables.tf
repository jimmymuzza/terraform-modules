variable "monitor_scheduled_query_rules_alert_v2s" {
  description = <<EOT
Map of monitor_scheduled_query_rules_alert_v2s, attributes below
Required:
    - evaluation_frequency
    - location
    - name
    - resource_group_name
    - scopes
    - severity
    - window_duration
    - criteria
Optional:
    - auto_mitigation_enabled
    - description
    - display_name
    - enabled
    - mute_actions_after_alert_duration
    - query_time_range_override
    - skip_query_validation
    - tags
    - target_resource_types
    - workspace_alerts_storage_enabled
    - action
    - identity
EOT

  type = map(object({
    evaluation_frequency              = string
    location                          = string
    name                              = string
    resource_group_name               = string
    scopes                            = list(string)
    severity                          = number
    window_duration                   = string
    auto_mitigation_enabled           = optional(bool)
    description                       = optional(string)
    display_name                      = optional(string)
    enabled                           = optional(bool)
    mute_actions_after_alert_duration = optional(string)
    query_time_range_override         = optional(string)
    skip_query_validation             = optional(bool)
    tags                              = optional(map(string))
    target_resource_types             = optional(list(string))
    workspace_alerts_storage_enabled  = optional(bool)
    action                            = optional(list(object({
            action_groups     = optional(list(string))
            custom_properties = optional(map(string))
        })))
    criteria                          = list(object({
            operator                = string
            query                   = string
            threshold               = number
            time_aggregation_method = string
            metric_measure_column   = optional(string)
            resource_id_column      = optional(string)
            dimension               = optional(list(object({
                name     = string
                operator = string
                values   = list(string)
            })))
            failing_periods         = optional(list(object({
                minimum_failing_periods_to_trigger_alert = number
                number_of_evaluation_periods             = number
            })))
        }))
    identity                          = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
