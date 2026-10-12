resource "aws_api_gateway_account" "api_gateway_accounts" {
  for_each = var.api_gateway_accounts

  cloudwatch_role_arn = each.value.cloudwatch_role_arn
  region              = each.value.region
}
