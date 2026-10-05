resource "aws_datasync_agent" "datasync_agents" {
  for_each = var.datasync_agents

  activation_key        = each.value.activation_key
  ip_address            = each.value.ip_address
  name                  = each.value.name
  private_link_endpoint = each.value.private_link_endpoint
  region                = each.value.region
  security_group_arns   = each.value.security_group_arns
  subnet_arns           = each.value.subnet_arns
  tags                  = each.value.tags
  tags_all              = each.value.tags_all
  vpc_endpoint_id       = each.value.vpc_endpoint_id
}
