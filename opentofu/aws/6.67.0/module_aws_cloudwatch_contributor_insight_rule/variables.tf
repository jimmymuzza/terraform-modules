variable "cloudwatch_contributor_insight_rules" {
  description = <<EOT
Map of cloudwatch_contributor_insight_rules, attributes below
Required:
    - rule_definition
    - rule_name
Optional:
    - region
    - rule_state
    - tags
EOT

  type = map(object({
    rule_definition = string
    rule_name       = string
    region          = optional(string)
    rule_state      = optional(string)
    tags            = optional(map(string))
  }))
}
