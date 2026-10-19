variable "prometheus_anomaly_detectors" {
  description = <<EOT
Map of prometheus_anomaly_detectors, attributes below
Required:
    - alias
    - workspace_id
Optional:
    - evaluation_interval_in_seconds
    - labels
    - region
    - tags
    - configuration
    - missing_data_action
EOT

  type = map(object({
    alias                          = string
    workspace_id                   = string
    evaluation_interval_in_seconds = optional(number)
    labels                         = optional(map(string))
    region                         = optional(string)
    tags                           = optional(map(string))
    configuration                  = optional(list(object({
            random_cut_forest = optional(list(object({
                query                           = string
                sample_size                     = optional(number)
                shingle_size                    = optional(number)
                ignore_near_expected_from_above = optional(list(object({
                    amount = optional(number)
                    ratio  = optional(number)
                })))
                ignore_near_expected_from_below = optional(list(object({
                    amount = optional(number)
                    ratio  = optional(number)
                })))
            })))
        })))
    missing_data_action            = optional(list(object({
            mark_as_anomaly = optional(bool)
            skip            = optional(bool)
        })))
  }))
}
