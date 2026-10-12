variable "glue_data_catalog_encryption_settings" {
  description = <<EOT
Map of glue_data_catalog_encryption_settings, attributes below
Required:
    - data_catalog_encryption_settings
Optional:
    - catalog_id
    - region
EOT

  type = map(object({
    catalog_id                       = optional(string)
    region                           = optional(string)
    data_catalog_encryption_settings = list(object({
            connection_password_encryption = list(object({
                return_connection_password_encrypted = bool
                aws_kms_key_id                       = optional(string)
            }))
            encryption_at_rest             = list(object({
                catalog_encryption_mode         = string
                catalog_encryption_service_role = optional(string)
                sse_aws_kms_key_id              = optional(string)
            }))
        }))
  }))
}
