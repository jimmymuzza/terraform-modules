variable "macie2_organization_configurations" {
  description = <<EOT
Map of macie2_organization_configurations, attributes below
Required:
    - auto_enable
Optional:
    - region
EOT

  type = map(object({
    auto_enable = bool
    region      = optional(string)
  }))
}
