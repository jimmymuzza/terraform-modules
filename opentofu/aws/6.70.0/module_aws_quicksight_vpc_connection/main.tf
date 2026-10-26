resource "aws_quicksight_vpc_connection" "quicksight_vpc_connections" {
  for_each = var.quicksight_vpc_connections

  name               = each.value.name
  role_arn           = each.value.role_arn
  security_group_ids = each.value.security_group_ids
  subnet_ids         = each.value.subnet_ids
  vpc_connection_id  = each.value.vpc_connection_id
  aws_account_id     = each.value.aws_account_id
  dns_resolvers      = each.value.dns_resolvers
  region             = each.value.region
  tags               = each.value.tags
}
