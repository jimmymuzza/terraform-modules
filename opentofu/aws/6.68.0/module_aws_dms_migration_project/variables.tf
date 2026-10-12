variable "dms_migration_projects" {
  description = <<EOT
Map of dms_migration_projects, attributes below
Required:
    - instance_profile_arn
Optional:
    - description
    - name
    - region
    - tags
    - transformation_rules
    - schema_conversion_application_attributes
    - source_data_provider_descriptor
    - target_data_provider_descriptor
EOT

  type = map(object({
    instance_profile_arn                     = string
    description                              = optional(string)
    name                                     = optional(string)
    region                                   = optional(string)
    tags                                     = optional(map(string))
    transformation_rules                     = optional(string)
    schema_conversion_application_attributes = optional(list(object({
            s3_bucket_path     = optional(string)
            s3_bucket_role_arn = optional(string)
        })))
    source_data_provider_descriptor          = optional(list(object({
            data_provider_arn               = string
            secrets_manager_access_role_arn = optional(string)
            secrets_manager_secret_id       = optional(string)
        })))
    target_data_provider_descriptor          = optional(list(object({
            data_provider_arn               = string
            secrets_manager_access_role_arn = optional(string)
            secrets_manager_secret_id       = optional(string)
        })))
  }))
}
