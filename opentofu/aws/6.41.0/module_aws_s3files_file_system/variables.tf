variable "s3files_file_systems" {
  description = <<EOT
Map of s3files_file_systems, attributes below
Required:
    - bucket
    - role_arn
Optional:
    - kms_key_id
    - prefix
    - region
    - tags
EOT

  type = map(object({
    bucket     = string
    role_arn   = string
    kms_key_id = optional(string)
    prefix     = optional(string)
    region     = optional(string)
    tags       = optional(map(string))
  }))
}
