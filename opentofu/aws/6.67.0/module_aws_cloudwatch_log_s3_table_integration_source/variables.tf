variable "cloudwatch_log_s3_table_integration_sources" {
  description = <<EOT
Map of cloudwatch_log_s3_table_integration_sources, attributes below
Required:
    - integration_arn
Optional:
    - region
    - data_source
EOT

  type = map(object({
    integration_arn = string
    region          = optional(string)
    data_source     = optional(list(object({
            name = string
            type = string
        })))
  }))
}
