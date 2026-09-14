variable "arc_kubernetes_provisioned_clusters" {
  description = <<EOT
Map of arc_kubernetes_provisioned_clusters, attributes below
Required:
    - location
    - name
    - resource_group_name
    - identity
Optional:
    - arc_agent_auto_upgrade_enabled
    - arc_agent_desired_version
    - tags
    - azure_active_directory
EOT

  type = map(object({
    location                       = string
    name                           = string
    resource_group_name            = string
    arc_agent_auto_upgrade_enabled = optional(bool)
    arc_agent_desired_version      = optional(string)
    tags                           = optional(map(string))
    azure_active_directory         = optional(list(object({
            admin_group_object_ids = optional(list(string))
            azure_rbac_enabled     = optional(bool)
            tenant_id              = optional(string)
        })))
    identity                       = list(object({
            type = string
        }))
  }))
}
