variable "data_factory_trigger_schedules" {
  description = <<EOT
Map of data_factory_trigger_schedules, attributes below
Required:
    - data_factory_id
    - name
Optional:
    - activated
    - annotations
    - description
    - end_time
    - frequency
    - interval
    - pipeline_name
    - pipeline_parameters
    - start_time
    - time_zone
    - pipeline
    - schedule
EOT

  type = map(object({
    data_factory_id     = string
    name                = string
    activated           = optional(bool)
    annotations         = optional(list(string))
    description         = optional(string)
    end_time            = optional(string)
    frequency           = optional(string)
    interval            = optional(number)
    pipeline_name       = optional(string)
    pipeline_parameters = optional(map(string))
    start_time          = optional(string)
    time_zone           = optional(string)
    pipeline            = optional(list(object({
            name       = string
            parameters = optional(map(string))
        })))
    schedule            = optional(list(object({
            days_of_month = optional(list(number))
            days_of_week  = optional(list(string))
            hours         = optional(list(number))
            minutes       = optional(list(number))
            monthly       = optional(list(object({
                weekday = string
                week    = optional(number)
            })))
        })))
  }))
}
