variable "sns_platform_applications" {
  description = <<EOT
Map of sns_platform_applications, attributes below
Required:
    - name
    - platform
    - platform_credential
Optional:
    - apple_platform_bundle_id
    - apple_platform_team_id
    - event_delivery_failure_topic_arn
    - event_endpoint_created_topic_arn
    - event_endpoint_deleted_topic_arn
    - event_endpoint_updated_topic_arn
    - failure_feedback_role_arn
    - platform_principal
    - region
    - success_feedback_role_arn
    - success_feedback_sample_rate
EOT

  type = map(object({
    name                             = string
    platform                         = string
    platform_credential              = string
    apple_platform_bundle_id         = optional(string)
    apple_platform_team_id           = optional(string)
    event_delivery_failure_topic_arn = optional(string)
    event_endpoint_created_topic_arn = optional(string)
    event_endpoint_deleted_topic_arn = optional(string)
    event_endpoint_updated_topic_arn = optional(string)
    failure_feedback_role_arn        = optional(string)
    platform_principal               = optional(string)
    region                           = optional(string)
    success_feedback_role_arn        = optional(string)
    success_feedback_sample_rate     = optional(string)
  }))
}
