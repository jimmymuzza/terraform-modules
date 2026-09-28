resource "aws_msk_cluster_policy" "msk_cluster_policies" {
  for_each = var.msk_cluster_policies

  cluster_arn = each.value.cluster_arn
  policy      = each.value.policy
  region      = each.value.region
}
