resource "aws_servicecatalog_portfolio_share" "servicecatalog_portfolio_shares" {
  for_each = var.servicecatalog_portfolio_shares

  portfolio_id        = each.value.portfolio_id
  principal_id        = each.value.principal_id
  type                = each.value.type
  accept_language     = each.value.accept_language
  region              = each.value.region
  share_principals    = each.value.share_principals
  share_tag_options   = each.value.share_tag_options
  wait_for_acceptance = each.value.wait_for_acceptance
}
