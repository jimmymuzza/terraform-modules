variable "wafregional_rate_based_rules" {
  description = <<EOT
Map of wafregional_rate_based_rules, attributes below
Required:
    - metric_name
    - name
    - rate_key
    - rate_limit
Optional:
    - region
    - tags
    - tags_all
    - predicate
EOT

  type = map(object({
    metric_name = string
    name        = string
    rate_key    = string
    rate_limit  = number
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
    predicate   = optional(set(object({
            data_id = string
            negated = bool
            type    = string
        })))
  }))
}
