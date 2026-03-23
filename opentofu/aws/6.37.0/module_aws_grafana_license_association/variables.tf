variable "grafana_license_associations" {
  description = <<EOT
Map of grafana_license_associations, attributes below
Required:
    - license_type
    - workspace_id
Optional:
    - grafana_token
    - region
EOT

  type = map(object({
    license_type  = string
    workspace_id  = string
    grafana_token = optional(string)
    region        = optional(string)
  }))
}
