resource "aws_vpc_endpoint_service_private_dns_verification" "vpc_endpoint_service_private_dns_verifications" {
  for_each = var.vpc_endpoint_service_private_dns_verifications

  service_id            = each.value.service_id
  region                = each.value.region
  wait_for_verification = each.value.wait_for_verification
}
