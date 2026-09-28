variable "sfn_activities" {
  description = <<EOT
Map of sfn_activities, attributes below
Required:
    - name
Optional:
    - region
    - tags
    - tags_all
    - encryption_configuration
EOT

  type = map(object({
    name                     = string
    region                   = optional(string)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
    encryption_configuration = optional(list(object({
            kms_data_key_reuse_period_seconds = optional(number)
            kms_key_id                        = optional(string)
            type                              = optional(string)
        })))
  }))
}
