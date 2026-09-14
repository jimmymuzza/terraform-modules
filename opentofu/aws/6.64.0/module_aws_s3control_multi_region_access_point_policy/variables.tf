variable "s3control_multi_region_access_point_policies" {
  description = <<EOT
Map of s3control_multi_region_access_point_policies, attributes below
Required:
    - details
Optional:
    - account_id
    - region
EOT

  type = map(object({
    account_id = optional(string)
    region     = optional(string)
    details    = list(object({
            name   = string
            policy = string
        }))
  }))
}
