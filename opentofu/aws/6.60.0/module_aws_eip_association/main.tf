resource "aws_eip_association" "eip_associations" {
  for_each = var.eip_associations

  allocation_id        = each.value.allocation_id
  allow_reassociation  = each.value.allow_reassociation
  instance_id          = each.value.instance_id
  network_interface_id = each.value.network_interface_id
  private_ip_address   = each.value.private_ip_address
  public_ip            = each.value.public_ip
  region               = each.value.region
}
