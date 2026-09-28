variable "ses_identity_notification_topics" {
  description = <<EOT
Map of ses_identity_notification_topics, attributes below
Required:
    - identity
    - notification_type
Optional:
    - include_original_headers
    - region
    - topic_arn
EOT

  type = map(object({
    identity                 = string
    notification_type        = string
    include_original_headers = optional(bool)
    region                   = optional(string)
    topic_arn                = optional(string)
  }))
}
