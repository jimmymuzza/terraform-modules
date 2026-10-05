variable "redshift_integrations" {
  description = <<EOT
Map of redshift_integrations, attributes below
Required:
    - integration_name
    - source_arn
    - target_arn
Optional:
    - additional_encryption_context
    - description
    - kms_key_id
    - region
    - tags
EOT

  type = map(object({
    integration_name              = string
    source_arn                    = string
    target_arn                    = string
    additional_encryption_context = optional(map(string))
    description                   = optional(string)
    kms_key_id                    = optional(string)
    region                        = optional(string)
    tags                          = optional(map(string))
  }))
}
