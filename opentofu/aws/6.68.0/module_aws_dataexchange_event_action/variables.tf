variable "dataexchange_event_actions" {
  description = <<EOT
Map of dataexchange_event_actions, attributes below
Optional:
    - region
    - action
    - event
EOT

  type = map(object({
    region = optional(string)
    action = optional(list(object({
            export_revision_to_s3 = optional(list(object({
                encryption           = optional(list(object({
                    kms_key_arn = optional(string)
                    type        = optional(string)
                })))
                revision_destination = optional(list(object({
                    bucket      = string
                    key_pattern = optional(string)
                })))
            })))
        })))
    event  = optional(list(object({
            revision_published = optional(list(object({
                data_set_id = string
            })))
        })))
  }))
}
