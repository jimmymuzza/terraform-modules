resource "aws_route53domains_delegation_signer_record" "route53domains_delegation_signer_records" {
  for_each = var.route53domains_delegation_signer_records

  domain_name = each.value.domain_name

  dynamic "signing_attributes" {
    for_each = each.value.signing_attributes != null ? each.value.signing_attributes : []
    content {
      algorithm  = signing_attributes.value.algorithm
      flags      = signing_attributes.value.flags
      public_key = signing_attributes.value.public_key
    }
  }
}
