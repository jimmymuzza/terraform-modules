variable "observabilityadmin_s3_table_integrations" {
  description = <<EOT
Map of observabilityadmin_s3_table_integrations, attributes below
Required:
    - role_arn
Optional:
    - region
    - tags
    - encryption
EOT

  type = map(object({
    role_arn   = string
    region     = optional(string)
    tags       = optional(map(string))
    encryption = optional(list(object({
            sse_algorithm = string
            kms_key_arn   = optional(string)
        })))
  }))
}
