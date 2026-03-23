variable "wafregional_rule_groups" {
  description = <<EOT
Map of wafregional_rule_groups, attributes below
Required:
    - metric_name
    - name
Optional:
    - region
    - tags
    - tags_all
    - activated_rule
EOT

  type = map(object({
    metric_name    = string
    name           = string
    region         = optional(string)
    tags           = optional(map(string))
    tags_all       = optional(map(string))
    activated_rule = optional(set(object({
            priority = number
            rule_id  = string
            type     = optional(string)
            action   = list(object({
                type = string
            }))
        })))
  }))
}
