resource "aws_redshift_partner" "redshift_partners" {
  for_each = var.redshift_partners

  account_id         = each.value.account_id
  cluster_identifier = each.value.cluster_identifier
  database_name      = each.value.database_name
  partner_name       = each.value.partner_name
  region             = each.value.region
}
