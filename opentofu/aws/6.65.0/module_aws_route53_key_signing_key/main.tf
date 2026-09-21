resource "aws_route53_key_signing_key" "route53_key_signing_keys" {
  for_each = var.route53_key_signing_keys

  hosted_zone_id             = each.value.hosted_zone_id
  key_management_service_arn = each.value.key_management_service_arn
  name                       = each.value.name
  status                     = each.value.status
}
