resource "aws_workspacesweb_network_settings" "workspacesweb_network_settings" {
  for_each = var.workspacesweb_network_settings

  security_group_ids = each.value.security_group_ids
  subnet_ids         = each.value.subnet_ids
  vpc_id             = each.value.vpc_id
  region             = each.value.region
  tags               = each.value.tags
}
