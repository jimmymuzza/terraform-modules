variable "s3control_access_point_policies" {
  description = <<EOT
Map of s3control_access_point_policies, attributes below
Required:
    - access_point_arn
    - policy
Optional:
    - region
EOT

  type = map(object({
    access_point_arn = string
    policy           = string
    region           = optional(string)
  }))
}
