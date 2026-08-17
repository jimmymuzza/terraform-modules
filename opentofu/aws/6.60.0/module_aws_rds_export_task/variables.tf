variable "rds_export_tasks" {
  description = <<EOT
Map of rds_export_tasks, attributes below
Required:
    - export_task_identifier
    - iam_role_arn
    - kms_key_id
    - s3_bucket_name
    - source_arn
Optional:
    - export_only
    - region
    - s3_prefix
EOT

  type = map(object({
    export_task_identifier = string
    iam_role_arn           = string
    kms_key_id             = string
    s3_bucket_name         = string
    source_arn             = string
    export_only            = optional(list(string))
    region                 = optional(string)
    s3_prefix              = optional(string)
  }))
}
