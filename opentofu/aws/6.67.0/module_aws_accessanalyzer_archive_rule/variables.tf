variable "accessanalyzer_archive_rules" {
  description = <<EOT
Map of accessanalyzer_archive_rules, attributes below
Required:
    - analyzer_name
    - rule_name
    - filter
Optional:
    - region
EOT

  type = map(object({
    analyzer_name = string
    rule_name     = string
    region        = optional(string)
    filter        = set(object({
            criteria = string
            contains = optional(list(string))
            eq       = optional(list(string))
            exists   = optional(string)
            neq      = optional(list(string))
        }))
  }))
}
