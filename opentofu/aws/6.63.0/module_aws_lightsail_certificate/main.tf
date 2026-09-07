resource "aws_lightsail_certificate" "lightsail_certificates" {
  for_each = var.lightsail_certificates

  name                      = each.value.name
  domain_name               = each.value.domain_name
  region                    = each.value.region
  subject_alternative_names = each.value.subject_alternative_names
  tags                      = each.value.tags
  tags_all                  = each.value.tags_all
}
