resource "aws_eks_fargate_profile" "eks_fargate_profiles" {
  for_each = var.eks_fargate_profiles

  cluster_name           = each.value.cluster_name
  fargate_profile_name   = each.value.fargate_profile_name
  pod_execution_role_arn = each.value.pod_execution_role_arn
  region                 = each.value.region
  subnet_ids             = each.value.subnet_ids
  tags                   = each.value.tags
  tags_all               = each.value.tags_all

  dynamic "selector" {
    for_each = each.value.selector != null ? each.value.selector : []
    content {
      namespace = selector.value.namespace
      labels    = selector.value.labels
    }
  }
}
