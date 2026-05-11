resource "aws_eks_pod_identity_association" "eks_pod_identity_associations" {
  for_each = var.eks_pod_identity_associations

  cluster_name         = each.value.cluster_name
  namespace            = each.value.namespace
  role_arn             = each.value.role_arn
  service_account      = each.value.service_account
  disable_session_tags = each.value.disable_session_tags
  region               = each.value.region
  tags                 = each.value.tags
  target_role_arn      = each.value.target_role_arn
}
