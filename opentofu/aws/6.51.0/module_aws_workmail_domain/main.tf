resource "aws_workmail_domain" "workmail_domains" {
  for_each = var.workmail_domains

  domain_name     = each.value.domain_name
  organization_id = each.value.organization_id
  region          = each.value.region
}
