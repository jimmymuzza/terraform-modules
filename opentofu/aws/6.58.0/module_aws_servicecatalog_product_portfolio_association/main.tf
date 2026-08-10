resource "aws_servicecatalog_product_portfolio_association" "servicecatalog_product_portfolio_associations" {
  for_each = var.servicecatalog_product_portfolio_associations

  portfolio_id        = each.value.portfolio_id
  product_id          = each.value.product_id
  accept_language     = each.value.accept_language
  region              = each.value.region
  source_portfolio_id = each.value.source_portfolio_id
}
