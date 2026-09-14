variable "inspector2_organization_configurations" {
  description = <<EOT
Map of inspector2_organization_configurations, attributes below
Required:
    - auto_enable
Optional:
    - region
EOT

  type = map(object({
    region      = optional(string)
    auto_enable = list(object({
            ec2             = bool
            ecr             = bool
            code_repository = optional(bool)
            lambda          = optional(bool)
            lambda_code     = optional(bool)
        }))
  }))
}
