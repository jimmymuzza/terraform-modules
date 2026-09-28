resource "aws_servicecatalog_principal_portfolio_association" "servicecatalog_principal_portfolio_associations" {
  for_each = var.servicecatalog_principal_portfolio_associations

  portfolio_id    = each.value.portfolio_id
  principal_arn   = each.value.principal_arn
  accept_language = each.value.accept_language
  principal_type  = each.value.principal_type
  region          = each.value.region
}
