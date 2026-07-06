resource "aws_redshift_cluster_iam_roles" "redshift_cluster_iam_roles" {
  for_each = var.redshift_cluster_iam_roles

  cluster_identifier   = each.value.cluster_identifier
  default_iam_role_arn = each.value.default_iam_role_arn
  iam_role_arns        = each.value.iam_role_arns
  region               = each.value.region
}
