variable "eventhub_namespace_disaster_recovery_configs" {
  description = <<EOT
Map of eventhub_namespace_disaster_recovery_configs, attributes below
Required:
    - name
    - namespace_name
    - partner_namespace_id
    - resource_group_name
EOT

  type = map(object({
    name                 = string
    namespace_name       = string
    partner_namespace_id = string
    resource_group_name  = string
  }))
}
