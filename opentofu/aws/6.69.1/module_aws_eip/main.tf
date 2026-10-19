resource "aws_eip" "eips" {
  for_each = var.eips

  address                   = each.value.address
  associate_with_private_ip = each.value.associate_with_private_ip
  customer_owned_ipv4_pool  = each.value.customer_owned_ipv4_pool
  domain                    = each.value.domain
  instance                  = each.value.instance
  ipam_pool_id              = each.value.ipam_pool_id
  network_border_group      = each.value.network_border_group
  network_interface         = each.value.network_interface
  public_ipv4_pool          = each.value.public_ipv4_pool
  region                    = each.value.region
  tags                      = each.value.tags
  tags_all                  = each.value.tags_all
}
