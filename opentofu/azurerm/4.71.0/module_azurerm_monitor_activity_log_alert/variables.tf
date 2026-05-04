variable "monitor_activity_log_alerts" {
  description = <<EOT
Map of monitor_activity_log_alerts, attributes below
Required:
    - location
    - name
    - resource_group_name
    - scopes
    - criteria
Optional:
    - description
    - enabled
    - tags
    - action
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    scopes              = set(string)
    description         = optional(string)
    enabled             = optional(bool)
    tags                = optional(map(string))
    action              = optional(list(object({
            action_group_id    = string
            webhook_properties = optional(map(string))
        })))
    criteria            = list(object({
            category                = string
            caller                  = optional(string)
            level                   = optional(string)
            levels                  = optional(list(string))
            operation_name          = optional(string)
            recommendation_category = optional(string)
            recommendation_impact   = optional(string)
            recommendation_type     = optional(string)
            resource_group          = optional(string)
            resource_groups         = optional(list(string))
            resource_id             = optional(string)
            resource_ids            = optional(list(string))
            resource_provider       = optional(string)
            resource_providers      = optional(list(string))
            resource_type           = optional(string)
            resource_types          = optional(list(string))
            status                  = optional(string)
            statuses                = optional(list(string))
            sub_status              = optional(string)
            sub_statuses            = optional(list(string))
            resource_health         = optional(list(object({
                current  = optional(set(string))
                previous = optional(set(string))
                reason   = optional(set(string))
            })))
            service_health          = optional(list(object({
                events    = optional(set(string))
                locations = optional(set(string))
                services  = optional(set(string))
            })))
        }))
  }))
}
