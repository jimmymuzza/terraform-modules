resource "azurerm_kubernetes_cluster_extension" "kubernetes_cluster_extensions" {
  for_each = var.kubernetes_cluster_extensions

  cluster_id                       = each.value.cluster_id
  extension_type                   = each.value.extension_type
  name                             = each.value.name
  configuration_protected_settings = each.value.configuration_protected_settings
  configuration_settings           = each.value.configuration_settings
  release_namespace                = each.value.release_namespace
  release_train                    = each.value.release_train
  target_namespace                 = each.value.target_namespace
  version                          = each.value.version

  dynamic "plan" {
    for_each = each.value.plan != null ? each.value.plan : []
    content {
      name           = plan.value.name
      product        = plan.value.product
      publisher      = plan.value.publisher
      promotion_code = plan.value.promotion_code
      version        = plan.value.version
    }
  }
}
