resource "aws_codebuild_resource_policy" "codebuild_resource_policies" {
  for_each = var.codebuild_resource_policies

  policy       = each.value.policy
  resource_arn = each.value.resource_arn
  region       = each.value.region
}
