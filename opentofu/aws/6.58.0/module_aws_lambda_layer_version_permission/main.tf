resource "aws_lambda_layer_version_permission" "lambda_layer_version_permissions" {
  for_each = var.lambda_layer_version_permissions

  action          = each.value.action
  layer_name      = each.value.layer_name
  principal       = each.value.principal
  statement_id    = each.value.statement_id
  version_number  = each.value.version_number
  organization_id = each.value.organization_id
  region          = each.value.region
  skip_destroy    = each.value.skip_destroy
}
