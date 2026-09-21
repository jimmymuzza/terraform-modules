variable "inspector_assessment_templates" {
  description = <<EOT
Map of inspector_assessment_templates, attributes below
Required:
    - duration
    - name
    - rules_package_arns
    - target_arn
Optional:
    - region
    - tags
    - tags_all
    - event_subscription
EOT

  type = map(object({
    duration           = number
    name               = string
    rules_package_arns = set(string)
    target_arn         = string
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    event_subscription = optional(set(object({
            event     = string
            topic_arn = string
        })))
  }))
}
