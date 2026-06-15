resource "aws_vpclattice_domain_verification" "vpclattice_domain_verifications" {
  for_each = var.vpclattice_domain_verifications

  domain_name = each.value.domain_name
  region      = each.value.region
  tags        = each.value.tags
}
