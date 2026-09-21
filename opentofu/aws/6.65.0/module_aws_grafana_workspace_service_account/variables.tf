variable "grafana_workspace_service_accounts" {
  description = <<EOT
Map of grafana_workspace_service_accounts, attributes below
Required:
    - grafana_role
    - name
    - workspace_id
Optional:
    - region
EOT

  type = map(object({
    grafana_role = string
    name         = string
    workspace_id = string
    region       = optional(string)
  }))
}
