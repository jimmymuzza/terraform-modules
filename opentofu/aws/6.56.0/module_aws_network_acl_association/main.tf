resource "aws_network_acl_association" "network_acl_associations" {
  for_each = var.network_acl_associations

  network_acl_id = each.value.network_acl_id
  subnet_id      = each.value.subnet_id
  region         = each.value.region
}
