variable "dms_event_subscriptions" {
  description = <<EOT
Map of dms_event_subscriptions, attributes below
Required:
    - event_categories
    - name
    - sns_topic_arn
    - source_type
Optional:
    - enabled
    - region
    - source_ids
    - tags
    - tags_all
EOT

  type = map(object({
    event_categories = set(string)
    name             = string
    sns_topic_arn    = string
    source_type      = string
    enabled          = optional(bool)
    region           = optional(string)
    source_ids       = optional(set(string))
    tags             = optional(map(string))
    tags_all         = optional(map(string))
  }))
}
