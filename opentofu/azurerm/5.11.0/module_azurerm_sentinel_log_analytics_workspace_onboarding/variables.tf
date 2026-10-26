variable "sentinel_log_analytics_workspace_onboardings" {
  description = <<EOT
Map of sentinel_log_analytics_workspace_onboardings, attributes below
Required:
    - workspace_id
Optional:
    - customer_managed_key_enabled
EOT

  type = map(object({
    workspace_id                 = string
    customer_managed_key_enabled = optional(bool)
  }))
}
