variable "accessanalyzer_analyzers" {
  description = <<EOT
Map of accessanalyzer_analyzers, attributes below
Required:
    - analyzer_name
Optional:
    - region
    - tags
    - tags_all
    - type
    - configuration
EOT

  type = map(object({
    analyzer_name = string
    region        = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
    type          = optional(string)
    configuration = optional(list(object({
            internal_access = optional(list(object({
                analysis_rule = optional(list(object({
                    inclusion = optional(list(object({
                        account_ids    = optional(list(string))
                        resource_arns  = optional(list(string))
                        resource_types = optional(list(string))
                    })))
                })))
            })))
            unused_access   = optional(list(object({
                unused_access_age = optional(number)
                analysis_rule     = optional(list(object({
                    exclusion = optional(list(object({
                        account_ids   = optional(list(string))
                        resource_tags = optional(list(map(string)))
                    })))
                })))
            })))
        })))
  }))
}
