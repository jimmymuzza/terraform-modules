variable "cloudwatch_event_archives" {
  description = <<EOT
Map of cloudwatch_event_archives, attributes below
Required:
    - event_source_arn
    - name
Optional:
    - description
    - event_pattern
    - kms_key_identifier
    - region
    - retention_days
EOT

  type = map(object({
    event_source_arn   = string
    name               = string
    description        = optional(string)
    event_pattern      = optional(string)
    kms_key_identifier = optional(string)
    region             = optional(string)
    retention_days     = optional(number)
  }))
}
