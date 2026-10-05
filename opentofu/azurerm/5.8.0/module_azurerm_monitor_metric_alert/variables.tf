variable "monitor_metric_alerts" {
  description = <<EOT
Map of monitor_metric_alerts, attributes below
Required:
    - name
    - resource_group_name
    - scopes
Optional:
    - auto_mitigate
    - description
    - enabled
    - frequency
    - severity
    - tags
    - target_resource_location
    - target_resource_type
    - window_size
    - action
    - application_insights_web_test_location_availability_criteria
    - criteria
    - dynamic_criteria
EOT

  type = map(object({
    name                                                         = string
    resource_group_name                                          = string
    scopes                                                       = set(string)
    auto_mitigate                                                = optional(bool)
    description                                                  = optional(string)
    enabled                                                      = optional(bool)
    frequency                                                    = optional(string)
    severity                                                     = optional(number)
    tags                                                         = optional(map(string))
    target_resource_location                                     = optional(string)
    target_resource_type                                         = optional(string)
    window_size                                                  = optional(string)
    action                                                       = optional(set(object({
            action_group_id    = string
            webhook_properties = optional(map(string))
        })))
    application_insights_web_test_location_availability_criteria = optional(list(object({
            component_id          = string
            failed_location_count = number
            web_test_id           = string
        })))
    criteria                                                     = optional(list(object({
            aggregation            = string
            metric_name            = string
            metric_namespace       = string
            operator               = string
            threshold              = number
            skip_metric_validation = optional(bool)
            dimension              = optional(list(object({
                name     = string
                operator = string
                values   = list(string)
            })))
        })))
    dynamic_criteria                                             = optional(list(object({
            aggregation              = string
            alert_sensitivity        = string
            metric_name              = string
            metric_namespace         = string
            operator                 = string
            evaluation_failure_count = optional(number)
            evaluation_total_count   = optional(number)
            ignore_data_before       = optional(string)
            skip_metric_validation   = optional(bool)
            dimension                = optional(list(object({
                name     = string
                operator = string
                values   = list(string)
            })))
        })))
  }))
}
