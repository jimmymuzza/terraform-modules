resource "aws_servicecatalog_constraint" "servicecatalog_constraints" {
  for_each = var.servicecatalog_constraints

  parameters      = each.value.parameters
  portfolio_id    = each.value.portfolio_id
  product_id      = each.value.product_id
  type            = each.value.type
  accept_language = each.value.accept_language
  description     = each.value.description
  region          = each.value.region
}
