variable "odb_autonomous_database_secrets_manager_integrations" {
  description = <<EOT
Map of odb_autonomous_database_secrets_manager_integrations, attributes below
Optional:
    - region
EOT

  type = map(object({
    region = optional(string)
  }))
}
