variable "grafana_workspace_api_keys" {
  description = <<EOT
Map of grafana_workspace_api_keys, attributes below
Required:
    - key_name
    - key_role
    - seconds_to_live
    - workspace_id
Optional:
    - region
EOT

  type = map(object({
    key_name        = string
    key_role        = string
    seconds_to_live = number
    workspace_id    = string
    region          = optional(string)
  }))
}
