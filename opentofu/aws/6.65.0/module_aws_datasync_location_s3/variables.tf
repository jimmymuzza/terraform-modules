variable "datasync_location_s3s" {
  description = <<EOT
Map of datasync_location_s3s, attributes below
Required:
    - s3_bucket_arn
    - subdirectory
    - s3_config
Optional:
    - agent_arns
    - region
    - s3_storage_class
    - tags
    - tags_all
EOT

  type = map(object({
    s3_bucket_arn    = string
    subdirectory     = string
    agent_arns       = optional(set(string))
    region           = optional(string)
    s3_storage_class = optional(string)
    tags             = optional(map(string))
    tags_all         = optional(map(string))
    s3_config        = list(object({
            bucket_access_role_arn = string
        }))
  }))
}
