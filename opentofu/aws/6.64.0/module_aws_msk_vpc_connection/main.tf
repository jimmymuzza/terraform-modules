resource "aws_msk_vpc_connection" "msk_vpc_connections" {
  for_each = var.msk_vpc_connections

  authentication     = each.value.authentication
  client_subnets     = each.value.client_subnets
  security_groups    = each.value.security_groups
  target_cluster_arn = each.value.target_cluster_arn
  vpc_id             = each.value.vpc_id
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all
}
