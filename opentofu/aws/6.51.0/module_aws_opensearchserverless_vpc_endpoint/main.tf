resource "aws_opensearchserverless_vpc_endpoint" "opensearchserverless_vpc_endpoints" {
  for_each = var.opensearchserverless_vpc_endpoints

  name               = each.value.name
  subnet_ids         = each.value.subnet_ids
  vpc_id             = each.value.vpc_id
  region             = each.value.region
  security_group_ids = each.value.security_group_ids
}
