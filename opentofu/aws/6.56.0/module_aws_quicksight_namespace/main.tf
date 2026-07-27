resource "aws_quicksight_namespace" "quicksight_namespaces" {
  for_each = var.quicksight_namespaces

  namespace      = each.value.namespace
  aws_account_id = each.value.aws_account_id
  identity_store = each.value.identity_store
  region         = each.value.region
  tags           = each.value.tags
}
