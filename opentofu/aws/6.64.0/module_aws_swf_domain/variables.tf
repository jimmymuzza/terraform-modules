variable "swf_domains" {
  description = <<EOT
Map of swf_domains, attributes below
Required:
    - workflow_execution_retention_period_in_days
Optional:
    - description
    - name
    - name_prefix
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    workflow_execution_retention_period_in_days = string
    description                                 = optional(string)
    name                                        = optional(string)
    name_prefix                                 = optional(string)
    region                                      = optional(string)
    tags                                        = optional(map(string))
    tags_all                                    = optional(map(string))
  }))
}
