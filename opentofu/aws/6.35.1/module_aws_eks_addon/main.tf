resource "aws_eks_addon" "eks_addons" {
  for_each = var.eks_addons

  addon_name                  = each.value.addon_name
  cluster_name                = each.value.cluster_name
  addon_version               = each.value.addon_version
  configuration_values        = each.value.configuration_values
  preserve                    = each.value.preserve
  region                      = each.value.region
  resolve_conflicts_on_create = each.value.resolve_conflicts_on_create
  resolve_conflicts_on_update = each.value.resolve_conflicts_on_update
  service_account_role_arn    = each.value.service_account_role_arn
  tags                        = each.value.tags
  tags_all                    = each.value.tags_all

  dynamic "pod_identity_association" {
    for_each = each.value.pod_identity_association != null ? each.value.pod_identity_association : []
    content {
      role_arn        = pod_identity_association.value.role_arn
      service_account = pod_identity_association.value.service_account
    }
  }
}
