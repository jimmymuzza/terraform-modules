variable "sns_topic_policies" {
  description = <<EOT
Map of sns_topic_policies, attributes below
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
