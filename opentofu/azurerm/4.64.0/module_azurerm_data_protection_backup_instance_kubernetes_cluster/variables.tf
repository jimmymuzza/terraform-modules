variable "data_protection_backup_instance_kubernetes_clusters" {
  description = <<EOT
Map of data_protection_backup_instance_kubernetes_clusters, attributes below
Required:
    - backup_policy_id
    - kubernetes_cluster_id
    - location
    - name
    - snapshot_resource_group_name
    - vault_id
Optional:
    - backup_datasource_parameters
EOT

  type = map(object({
    backup_policy_id             = string
    kubernetes_cluster_id        = string
    location                     = string
    name                         = string
    snapshot_resource_group_name = string
    vault_id                     = string
    backup_datasource_parameters = optional(list(object({
            cluster_scoped_resources_enabled = optional(bool)
            excluded_namespaces              = optional(list(string))
            excluded_resource_types          = optional(list(string))
            included_namespaces              = optional(list(string))
            included_resource_types          = optional(list(string))
            label_selectors                  = optional(list(string))
            volume_snapshot_enabled          = optional(bool)
        })))
  }))
}
