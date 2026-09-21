resource "aws_servicecatalog_portfolio" "servicecatalog_portfolios" {
  for_each = var.servicecatalog_portfolios

  name          = each.value.name
  provider_name = each.value.provider_name
  description   = each.value.description
  region        = each.value.region
  tags          = each.value.tags
  tags_all      = each.value.tags_all
}
