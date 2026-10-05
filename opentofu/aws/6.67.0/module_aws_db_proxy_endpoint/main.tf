resource "aws_db_proxy_endpoint" "db_proxy_endpoints" {
  for_each = var.db_proxy_endpoints

  db_proxy_endpoint_name = each.value.db_proxy_endpoint_name
  db_proxy_name          = each.value.db_proxy_name
  vpc_subnet_ids         = each.value.vpc_subnet_ids
  region                 = each.value.region
  tags                   = each.value.tags
  tags_all               = each.value.tags_all
  target_role            = each.value.target_role
  vpc_security_group_ids = each.value.vpc_security_group_ids
}
