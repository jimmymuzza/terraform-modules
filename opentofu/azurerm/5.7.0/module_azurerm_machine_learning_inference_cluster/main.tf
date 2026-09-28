resource "azurerm_machine_learning_inference_cluster" "machine_learning_inference_clusters" {
  for_each = var.machine_learning_inference_clusters

  kubernetes_cluster_id         = each.value.kubernetes_cluster_id
  location                      = each.value.location
  machine_learning_workspace_id = each.value.machine_learning_workspace_id
  name                          = each.value.name
  cluster_purpose               = each.value.cluster_purpose
  description                   = each.value.description
  tags                          = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "ssl" {
    for_each = each.value.ssl != null ? each.value.ssl : []
    content {
      cert                      = ssl.value.cert
      cname                     = ssl.value.cname
      key                       = ssl.value.key
      leaf_domain_label         = ssl.value.leaf_domain_label
      overwrite_existing_domain = ssl.value.overwrite_existing_domain
    }
  }
}
