variable "cloudwatch_contributor_managed_insight_rules" {
  description = <<EOT
Map of cloudwatch_contributor_managed_insight_rules, attributes below
Required:
    - resource_arn
    - template_name
Optional:
    - region
    - state
    - tags
EOT

  type = map(object({
    resource_arn  = string
    template_name = string
    region        = optional(string)
    state         = optional(string)
    tags          = optional(map(string))
  }))
}
