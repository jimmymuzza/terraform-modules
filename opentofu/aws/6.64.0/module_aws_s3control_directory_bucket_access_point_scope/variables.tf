variable "s3control_directory_bucket_access_point_scopes" {
  description = <<EOT
Map of s3control_directory_bucket_access_point_scopes, attributes below
Required:
    - account_id
    - name
Optional:
    - region
    - scope
EOT

  type = map(object({
    account_id = string
    name       = string
    region     = optional(string)
    scope      = optional(list(object({
            permissions = optional(list(string))
            prefixes    = optional(list(string))
        })))
  }))
}
