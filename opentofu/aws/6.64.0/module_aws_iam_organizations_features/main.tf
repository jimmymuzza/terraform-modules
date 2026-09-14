resource "aws_iam_organizations_features" "iam_organizations_features" {
  for_each = var.iam_organizations_features

  enabled_features = each.value.enabled_features
}
