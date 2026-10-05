variable "wafregional_rules" {
  description = <<EOT
Map of wafregional_rules, attributes below
Required:
    - metric_name
    - name
Optional:
    - region
    - tags
    - tags_all
    - predicate
EOT

  type = map(object({
    metric_name = string
    name        = string
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
