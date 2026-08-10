variable "s3files_file_system_policies" {
  description = <<EOT
Map of s3files_file_system_policies, attributes below
Required:
    - file_system_id
    - policy
Optional:
    - region
EOT

  type = map(object({
    file_system_id = string
    policy         = string
    region         = optional(string)
  }))
}
