variable "waf_rate_based_rules" {
  description = <<EOT
Map of waf_rate_based_rules, attributes below
Required:
    - metric_name
    - name
    - rate_key
    - rate_limit
Optional:
    - tags
    - tags_all
    - predicates
EOT

  type = map(object({
    metric_name = string
    name        = string
    rate_key    = string
    rate_limit  = number
    tags        = optional(map(string))
    tags_all    = optional(map(string))
    predicates  = optional(set(object({
            data_id = string
            negated = bool
            type    = string
        })))
  }))
}
