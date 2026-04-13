variable "sentinel_alert_rule_anomaly_duplicates" {
  description = <<EOT
Map of sentinel_alert_rule_anomaly_duplicates, attributes below
Required:
    - built_in_rule_id
    - display_name
    - enabled
    - log_analytics_workspace_id
    - mode
Optional:
    - multi_select_observation
    - prioritized_exclude_observation
    - single_select_observation
    - threshold_observation
EOT

  type = map(object({
    built_in_rule_id                = string
    display_name                    = string
    enabled                         = bool
    log_analytics_workspace_id      = string
    mode                            = string
    multi_select_observation        = optional(list(object({
            name   = string
            values = list(string)
        })))
    prioritized_exclude_observation = optional(list(object({
            name       = string
            exclude    = optional(string)
            prioritize = optional(string)
        })))
    single_select_observation       = optional(list(object({
            name  = string
            value = string
        })))
    threshold_observation           = optional(list(object({
            name  = string
            value = string
        })))
  }))
}
