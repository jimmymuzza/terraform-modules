resource "aws_lambda_invocation" "lambda_invocations" {
  for_each = var.lambda_invocations

  function_name   = each.value.function_name
  input           = each.value.input
  lifecycle_scope = each.value.lifecycle_scope
  qualifier       = each.value.qualifier
  region          = each.value.region
  tenant_id       = each.value.tenant_id
  terraform_key   = each.value.terraform_key
  triggers        = each.value.triggers
}
