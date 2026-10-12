resource "aws_ec2_instance_connect_endpoint" "ec2_instance_connect_endpoints" {
  for_each = var.ec2_instance_connect_endpoints

  subnet_id          = each.value.subnet_id
  ip_address_type    = each.value.ip_address_type
  preserve_client_ip = each.value.preserve_client_ip
  region             = each.value.region
  security_group_ids = each.value.security_group_ids
  tags               = each.value.tags
}
