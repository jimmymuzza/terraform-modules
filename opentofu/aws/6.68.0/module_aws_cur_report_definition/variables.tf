variable "cur_report_definitions" {
  description = <<EOT
Map of cur_report_definitions, attributes below
Required:
    - additional_schema_elements
    - compression
    - format
    - report_name
    - s3_bucket
    - s3_prefix
    - s3_region
    - time_unit
Optional:
    - additional_artifacts
    - refresh_closed_reports
    - report_versioning
    - tags
    - tags_all
EOT

  type = map(object({
    additional_schema_elements = set(string)
    compression                = string
    format                     = string
    report_name                = string
    s3_bucket                  = string
    s3_prefix                  = string
    s3_region                  = string
    time_unit                  = string
    additional_artifacts       = optional(set(string))
    refresh_closed_reports     = optional(bool)
    report_versioning          = optional(string)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
  }))
}
