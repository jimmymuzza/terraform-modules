variable "monitor_alert_prometheus_rule_groups" {
  description = <<EOT
Map of monitor_alert_prometheus_rule_groups, attributes below
Required:
    - location
    - name
    - resource_group_name
    - scopes
    - rule
Optional:
    - cluster_name
    - description
    - interval
    - rule_group_enabled
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    scopes              = list(string)
    cluster_name        = optional(string)
    description         = optional(string)
    interval            = optional(string)
    rule_group_enabled  = optional(bool)
    tags                = optional(map(string))
    rule                = list(object({
            expression       = string
            alert            = optional(string)
            annotations      = optional(map(string))
            enabled          = optional(bool)
            for              = optional(string)
            labels           = optional(map(string))
            record           = optional(string)
            severity         = optional(number)
            action           = optional(list(object({
                action_group_id   = string
                action_properties = optional(map(string))
            })))
            alert_resolution = optional(list(object({
                auto_resolved   = optional(bool)
                time_to_resolve = optional(string)
            })))
        }))
  }))
}
