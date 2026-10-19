variable "glue_triggers" {
  description = <<EOT
Map of glue_triggers, attributes below
Required:
    - name
    - type
    - actions
Optional:
    - description
    - enabled
    - region
    - schedule
    - start_on_creation
    - tags
    - tags_all
    - workflow_name
    - event_batching_condition
    - predicate
EOT

  type = map(object({
    name                     = string
    type                     = string
    description              = optional(string)
    enabled                  = optional(bool)
    region                   = optional(string)
    schedule                 = optional(string)
    start_on_creation        = optional(bool)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
    workflow_name            = optional(string)
    actions                  = list(object({
            arguments              = optional(map(string))
            crawler_name           = optional(string)
            job_name               = optional(string)
            security_configuration = optional(string)
            timeout                = optional(number)
            notification_property  = optional(list(object({
                notify_delay_after = optional(number)
            })))
        }))
    event_batching_condition = optional(list(object({
            batch_size   = number
            batch_window = optional(number)
        })))
    predicate                = optional(list(object({
            logical    = optional(string)
            conditions = list(object({
                crawl_state      = optional(string)
                crawler_name     = optional(string)
                job_name         = optional(string)
                logical_operator = optional(string)
                state            = optional(string)
            }))
        })))
  }))
}
