resource "aws_lambda_resource_policy" "lambda_resource_policies" {
  for_each = var.lambda_resource_policies

  policy       = each.value.policy
  resource_arn = each.value.resource_arn
  region       = each.value.region
}
