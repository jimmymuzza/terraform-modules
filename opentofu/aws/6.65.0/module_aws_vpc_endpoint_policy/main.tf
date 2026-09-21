resource "aws_vpc_endpoint_policy" "vpc_endpoint_policies" {
  for_each = var.vpc_endpoint_policies

  vpc_endpoint_id = each.value.vpc_endpoint_id
  policy          = each.value.policy
  region          = each.value.region
}
