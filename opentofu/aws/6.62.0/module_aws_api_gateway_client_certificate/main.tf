resource "aws_api_gateway_client_certificate" "api_gateway_client_certificates" {
  for_each = var.api_gateway_client_certificates

  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
