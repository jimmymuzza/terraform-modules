variable "data_factory_trigger_tumbling_windows" {
  description = <<EOT
Map of data_factory_trigger_tumbling_windows, attributes below
Required:
    - data_factory_id
    - frequency
    - interval
    - name
    - start_time
    - pipeline
Optional:
    - activated
    - additional_properties
    - annotations
    - delay
    - description
    - end_time
    - max_concurrency
    - retry
    - trigger_dependency
EOT

  type = map(object({
    data_factory_id       = string
    frequency             = string
    interval              = number
    name                  = string
    start_time            = string
    activated             = optional(bool)
    additional_properties = optional(map(string))
    annotations           = optional(list(string))
    delay                 = optional(string)
    description           = optional(string)
    end_time              = optional(string)
    max_concurrency       = optional(number)
    pipeline              = list(object({
            name       = string
            parameters = optional(map(string))
        }))
    retry                 = optional(list(object({
            count    = number
            interval = optional(number)
        })))
    trigger_dependency    = optional(set(object({
            offset       = optional(string)
            size         = optional(string)
            trigger_name = optional(string)
        })))
  }))
}
