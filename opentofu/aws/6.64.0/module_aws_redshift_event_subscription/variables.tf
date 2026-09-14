variable "redshift_event_subscriptions" {
  description = <<EOT
Map of redshift_event_subscriptions, attributes below
Required:
    - name
    - sns_topic_arn
Optional:
    - enabled
    - event_categories
    - region
    - severity
    - source_ids
    - source_type
    - tags
    - tags_all
EOT

  type = map(object({
    name             = string
    sns_topic_arn    = string
    enabled          = optional(bool)
    event_categories = optional(set(string))
    region           = optional(string)
    severity         = optional(string)
    source_ids       = optional(set(string))
    source_type      = optional(string)
    tags             = optional(map(string))
    tags_all         = optional(map(string))
  }))
}
