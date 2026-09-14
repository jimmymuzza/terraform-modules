variable "appsync_source_api_associations" {
  description = <<EOT
Map of appsync_source_api_associations, attributes below
Optional:
    - description
    - merged_api_arn
    - merged_api_id
    - region
    - source_api_arn
    - source_api_association_config
    - source_api_id
EOT

  type = map(object({
    description                   = optional(string)
    merged_api_arn                = optional(string)
    merged_api_id                 = optional(string)
    region                        = optional(string)
    source_api_arn                = optional(string)
    source_api_association_config = optional(list(object({
            merge_type = string
        })))
    source_api_id                 = optional(string)
  }))
}
