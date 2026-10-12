variable "s3control_access_grants_instances" {
  description = <<EOT
Map of s3control_access_grants_instances, attributes below
Optional:
    - account_id
    - identity_center_arn
    - region
    - tags
EOT

  type = map(object({
    account_id          = optional(string)
    identity_center_arn = optional(string)
    region              = optional(string)
    tags                = optional(map(string))
  }))
}
