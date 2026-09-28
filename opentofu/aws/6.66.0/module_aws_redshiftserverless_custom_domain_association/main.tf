resource "aws_redshiftserverless_custom_domain_association" "redshiftserverless_custom_domain_associations" {
  for_each = var.redshiftserverless_custom_domain_associations

  custom_domain_certificate_arn = each.value.custom_domain_certificate_arn
  custom_domain_name            = each.value.custom_domain_name
  workgroup_name                = each.value.workgroup_name
  region                        = each.value.region
}
