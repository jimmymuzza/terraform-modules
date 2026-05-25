variable "sns_topic_data_protection_policies" {
  description = <<EOT
Map of sns_topic_data_protection_policies, attributes below
Required:
    - arn
    - policy
Optional:
    - region
EOT

  type = map(object({
    arn    = string
    policy = string
    region = optional(string)
  }))
}
