resource "aws_vpc_endpoint_service_allowed_principal" "vpc_endpoint_service_allowed_principals" {
  for_each = var.vpc_endpoint_service_allowed_principals

  principal_arn           = each.value.principal_arn
  vpc_endpoint_service_id = each.value.vpc_endpoint_service_id
  region                  = each.value.region
}
