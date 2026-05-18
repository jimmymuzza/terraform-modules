resource "aws_eip_domain_name" "eip_domain_names" {
  for_each = var.eip_domain_names

  allocation_id = each.value.allocation_id
  domain_name   = each.value.domain_name
  region        = each.value.region
}
