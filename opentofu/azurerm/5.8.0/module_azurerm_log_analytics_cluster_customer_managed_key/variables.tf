variable "log_analytics_cluster_customer_managed_keys" {
  description = <<EOT
Map of log_analytics_cluster_customer_managed_keys, attributes below
Required:
    - key_vault_key_id
    - log_analytics_cluster_id
EOT

  type = map(object({
    key_vault_key_id         = string
    log_analytics_cluster_id = string
  }))
}
