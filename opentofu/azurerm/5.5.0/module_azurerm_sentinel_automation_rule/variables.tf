variable "sentinel_automation_rules" {
  description = <<EOT
Map of sentinel_automation_rules, attributes below
Required:
    - display_name
    - log_analytics_workspace_id
    - name
    - order
Optional:
    - condition_json
    - enabled
    - expiration
    - triggers_on
    - triggers_when
    - action_incident
    - action_incident_task
    - action_playbook
EOT

  type = map(object({
    display_name               = string
    log_analytics_workspace_id = string
    name                       = string
    order                      = number
    condition_json             = optional(string)
    enabled                    = optional(bool)
    expiration                 = optional(string)
    triggers_on                = optional(string)
    triggers_when              = optional(string)
    action_incident            = optional(list(object({
            order                  = number
            classification         = optional(string)
            classification_comment = optional(string)
            labels                 = optional(list(string))
            owner_id               = optional(string)
            severity               = optional(string)
            status                 = optional(string)
        })))
    action_incident_task       = optional(list(object({
            order       = number
            title       = string
            description = optional(string)
        })))
    action_playbook            = optional(list(object({
            logic_app_id = string
            order        = number
            tenant_id    = optional(string)
        })))
  }))
}
