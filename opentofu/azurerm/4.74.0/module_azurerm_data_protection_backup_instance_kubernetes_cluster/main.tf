resource "azurerm_data_protection_backup_instance_kubernetes_cluster" "data_protection_backup_instance_kubernetes_clusters" {
  for_each = var.data_protection_backup_instance_kubernetes_clusters

  backup_policy_id             = each.value.backup_policy_id
  kubernetes_cluster_id        = each.value.kubernetes_cluster_id
  location                     = each.value.location
  name                         = each.value.name
  snapshot_resource_group_name = each.value.snapshot_resource_group_name
  vault_id                     = each.value.vault_id

  dynamic "backup_datasource_parameters" {
    for_each = each.value.backup_datasource_parameters != null ? each.value.backup_datasource_parameters : []
    content {
      cluster_scoped_resources_enabled = backup_datasource_parameters.value.cluster_scoped_resources_enabled
      excluded_namespaces              = backup_datasource_parameters.value.excluded_namespaces
      excluded_resource_types          = backup_datasource_parameters.value.excluded_resource_types
      included_namespaces              = backup_datasource_parameters.value.included_namespaces
      included_resource_types          = backup_datasource_parameters.value.included_resource_types
      label_selectors                  = backup_datasource_parameters.value.label_selectors
      volume_snapshot_enabled          = backup_datasource_parameters.value.volume_snapshot_enabled
    }
  }
}
