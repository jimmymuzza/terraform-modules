resource "aws_vpclattice_service" "vpclattice_services" {
  for_each = var.vpclattice_services

  name                 = each.value.name
  auth_type            = each.value.auth_type
  certificate_arn      = each.value.certificate_arn
  custom_domain_name   = each.value.custom_domain_name
  idle_timeout_seconds = each.value.idle_timeout_seconds
  region               = each.value.region
  tags                 = each.value.tags
  tags_all             = each.value.tags_all
}
