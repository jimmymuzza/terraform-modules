variable "db_event_subscriptions" {
  description = <<EOT
Map of db_event_subscriptions, attributes below
Required:
    - sns_topic
Optional:
    - enabled
    - event_categories
    - name
    - name_prefix
    - region
    - source_ids
    - source_type
    - tags
    - tags_all
EOT

  type = map(object({
    sns_topic        = string
    enabled          = optional(bool)
    event_categories = optional(set(string))
    name             = optional(string)
    name_prefix      = optional(string)
    region           = optional(string)
    source_ids       = optional(set(string))
    source_type      = optional(string)
    tags             = optional(map(string))
    tags_all         = optional(map(string))
  }))
}
