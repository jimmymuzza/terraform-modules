resource "aws_lambda_permission" "lambda_permissions" {
  for_each = var.lambda_permissions

  action                   = each.value.action
  function_name            = each.value.function_name
  principal                = each.value.principal
  event_source_token       = each.value.event_source_token
  function_url_auth_type   = each.value.function_url_auth_type
  invoked_via_function_url = each.value.invoked_via_function_url
  principal_org_id         = each.value.principal_org_id
  qualifier                = each.value.qualifier
  region                   = each.value.region
  source_account           = each.value.source_account
  source_arn               = each.value.source_arn
  statement_id             = each.value.statement_id
  statement_id_prefix      = each.value.statement_id_prefix
}
