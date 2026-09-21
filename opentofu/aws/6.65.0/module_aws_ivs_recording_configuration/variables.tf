variable "ivs_recording_configurations" {
  description = <<EOT
Map of ivs_recording_configurations, attributes below
Required:
    - destination_configuration
Optional:
    - name
    - recording_reconnect_window_seconds
    - region
    - tags
    - tags_all
    - thumbnail_configuration
EOT

  type = map(object({
    name                               = optional(string)
    recording_reconnect_window_seconds = optional(number)
    region                             = optional(string)
    tags                               = optional(map(string))
    tags_all                           = optional(map(string))
    destination_configuration          = list(object({
            s3 = list(object({
                bucket_name = string
            }))
        }))
    thumbnail_configuration            = optional(list(object({
            recording_mode          = optional(string)
            target_interval_seconds = optional(number)
        })))
  }))
}
