variable "s3control_access_grants_locations" {
  description = <<EOT
Map of s3control_access_grants_locations, attributes below
Required:
    - iam_role_arn
    - location_scope
Optional:
    - account_id
    - region
    - tags
EOT

  type = map(object({
    iam_role_arn   = string
    location_scope = string
    account_id     = optional(string)
    region         = optional(string)
    tags           = optional(map(string))
  }))
}
