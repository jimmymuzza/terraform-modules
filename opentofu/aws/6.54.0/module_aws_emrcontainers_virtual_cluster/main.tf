resource "aws_emrcontainers_virtual_cluster" "emrcontainers_virtual_clusters" {
  for_each = var.emrcontainers_virtual_clusters

  name     = each.value.name
  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all

  dynamic "container_provider" {
    for_each = each.value.container_provider != null ? each.value.container_provider : []
    content {
      type = container_provider.value.type

      dynamic "info" {
        for_each = container_provider.value.info != null ? container_provider.value.info : []
        content {

          dynamic "eks_info" {
            for_each = info.value.eks_info != null ? info.value.eks_info : []
            content {
              namespace = eks_info.value.namespace
            }
          }
        }
      }
    }
  }
}
