variable "monitor_smart_detector_alert_rules" {
  description = <<EOT
Map of monitor_smart_detector_alert_rules, attributes below
Required:
    - detector_type
    - frequency
    - name
    - resource_group_name
    - scope_resource_ids
    - severity
    - action_group
Optional:
    - description
    - enabled
    - tags
    - throttling_duration
EOT

  type = map(object({
    detector_type       = string
    frequency           = string
    name                = string
    resource_group_name = string
    scope_resource_ids  = set(string)
    severity            = string
    description         = optional(string)
    enabled             = optional(bool)
    tags                = optional(map(string))
    throttling_duration = optional(string)
    action_group        = list(object({
            ids             = set(string)
            email_subject   = optional(string)
            webhook_payload = optional(string)
        }))
  }))
}
