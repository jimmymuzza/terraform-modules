resource "aws_odb_iam_role_association" "odb_iam_role_associations" {
  for_each = var.odb_iam_role_associations

  aws_integration = each.value.aws_integration
  iam_role_arn    = each.value.iam_role_arn
  resource_arn    = each.value.resource_arn
  region          = each.value.region
}
