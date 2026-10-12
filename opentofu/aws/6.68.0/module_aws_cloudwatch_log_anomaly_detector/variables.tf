variable "cloudwatch_log_anomaly_detectors" {
  description = <<EOT
Map of cloudwatch_log_anomaly_detectors, attributes below
Required:
    - enabled
    - log_group_arn_list
Optional:
    - anomaly_visibility_time
    - detector_name
    - evaluation_frequency
    - filter_pattern
    - kms_key_id
    - region
    - tags
EOT

  type = map(object({
    enabled                 = bool
    log_group_arn_list      = list(string)
    anomaly_visibility_time = optional(number)
    detector_name           = optional(string)
    evaluation_frequency    = optional(string)
    filter_pattern          = optional(string)
    kms_key_id              = optional(string)
    region                  = optional(string)
    tags                    = optional(map(string))
  }))
}
