variable "evidently_launches" {
  description = <<EOT
Map of evidently_launches, attributes below
Required:
    - name
    - project
    - groups
Optional:
    - description
    - randomization_salt
    - region
    - tags
    - tags_all
    - metric_monitors
    - scheduled_splits_config
EOT

  type = map(object({
    name                    = string
    project                 = string
    description             = optional(string)
    randomization_salt      = optional(string)
    region                  = optional(string)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
    groups                  = list(object({
            feature     = string
            name        = string
            variation   = string
            description = optional(string)
        }))
    metric_monitors         = optional(list(object({
            metric_definition = list(object({
                entity_id_key = string
                name          = string
                value_key     = string
                event_pattern = optional(string)
                unit_label    = optional(string)
            }))
        })))
    scheduled_splits_config = optional(list(object({
            steps = list(object({
                group_weights     = map(number)
                start_time        = string
                segment_overrides = optional(list(object({
                    evaluation_order = number
                    segment          = string
                    weights          = map(number)
                })))
            }))
        })))
  }))
}
