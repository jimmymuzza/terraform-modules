variable "ami_launch_permissions" {
  description = <<EOT
Map of ami_launch_permissions, attributes below
Required:
    - image_id
Optional:
    - account_id
    - group
    - organization_arn
    - organizational_unit_arn
    - region
EOT

  type = map(object({
    image_id                = string
    account_id              = optional(string)
    group                   = optional(string)
    organization_arn        = optional(string)
    organizational_unit_arn = optional(string)
    region                  = optional(string)
  }))
}
