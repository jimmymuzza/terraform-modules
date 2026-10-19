variable "securityhub_standards_subscriptions" {
  description = <<EOT
Map of securityhub_standards_subscriptions, attributes below
Required:
    - standards_arn
Optional:
    - region
EOT

  type = map(object({
    standards_arn = string
    region        = optional(string)
  }))
}
