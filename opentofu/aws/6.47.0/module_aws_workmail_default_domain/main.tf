resource "aws_workmail_default_domain" "workmail_default_domains" {
  for_each = var.workmail_default_domains

  domain_name     = each.value.domain_name
  organization_id = each.value.organization_id
  region          = each.value.region
}
