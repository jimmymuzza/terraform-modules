variable "waf_rules" {
  description = <<EOT
Map of waf_rules, attributes below
Required:
    - metric_name
    - name
Optional:
    - tags
    - tags_all
    - predicates
EOT

  type = map(object({
    metric_name = string
    name        = string
    tags        = optional(map(string))
    tags_all    = optional(map(string))
    predicates  = optional(set(object({
            data_id = string
            negated = bool
            type    = string
        })))
  }))
}
