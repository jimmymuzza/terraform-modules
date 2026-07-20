variable "detective_organization_configurations" {
  description = <<EOT
Map of detective_organization_configurations, attributes below
Required:
    - auto_enable
    - graph_arn
Optional:
    - region
EOT

  type = map(object({
    auto_enable = bool
    graph_arn   = string
    region      = optional(string)
  }))
}
