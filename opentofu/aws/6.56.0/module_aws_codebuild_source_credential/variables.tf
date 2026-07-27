variable "codebuild_source_credentials" {
  description = <<EOT
Map of codebuild_source_credentials, attributes below
Required:
    - auth_type
    - server_type
    - token
Optional:
    - region
    - user_name
EOT

  type = map(object({
    auth_type   = string
    server_type = string
    token       = string
    region      = optional(string)
    user_name   = optional(string)
  }))
}
