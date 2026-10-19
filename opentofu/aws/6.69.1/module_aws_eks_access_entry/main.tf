resource "aws_eks_access_entry" "eks_access_entries" {
  for_each = var.eks_access_entries

  cluster_name      = each.value.cluster_name
  principal_arn     = each.value.principal_arn
  kubernetes_groups = each.value.kubernetes_groups
  region            = each.value.region
  tags              = each.value.tags
  tags_all          = each.value.tags_all
  type              = each.value.type
  user_name         = each.value.user_name
}
