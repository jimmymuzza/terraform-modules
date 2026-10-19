resource "azurerm_arc_kubernetes_cluster_extension" "arc_kubernetes_cluster_extensions" {
  for_each = var.arc_kubernetes_cluster_extensions

  cluster_id                       = each.value.cluster_id
  extension_type                   = each.value.extension_type
  name                             = each.value.name
  configuration_protected_settings = each.value.configuration_protected_settings
  configuration_settings           = each.value.configuration_settings
  release_namespace                = each.value.release_namespace
  release_train                    = each.value.release_train
  target_namespace                 = each.value.target_namespace
  version                          = each.value.version

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type = identity.value.type
    }
  }
}
