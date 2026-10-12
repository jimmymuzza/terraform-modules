variable "s3control_access_grants_instance_resource_policies" {
  description = <<EOT
Map of s3control_access_grants_instance_resource_policies, attributes below
Required:
    - policy
Optional:
    - account_id
    - region
EOT

  type = map(object({
    policy     = string
    account_id = optional(string)
    region     = optional(string)
  }))
}
