variable "kinesis_video_streams" {
  description = <<EOT
Map of kinesis_video_streams, attributes below
Required:
    - name
Optional:
    - data_retention_in_hours
    - device_name
    - kms_key_id
    - media_type
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name                    = string
    data_retention_in_hours = optional(number)
    device_name             = optional(string)
    kms_key_id              = optional(string)
    media_type              = optional(string)
    region                  = optional(string)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
  }))
}
