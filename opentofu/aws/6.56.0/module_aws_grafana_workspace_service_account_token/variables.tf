variable "grafana_workspace_service_account_tokens" {
  description = <<EOT
Map of grafana_workspace_service_account_tokens, attributes below
Required:
    - name
    - seconds_to_live
    - service_account_id
    - workspace_id
Optional:
    - region
EOT

  type = map(object({
    name               = string
    seconds_to_live    = number
    service_account_id = string
    workspace_id       = string
    region             = optional(string)
  }))
}
