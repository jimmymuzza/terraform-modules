resource "aws_lightsail_lb_certificate" "lightsail_lb_certificates" {
  for_each = var.lightsail_lb_certificates

  lb_name                   = each.value.lb_name
  name                      = each.value.name
  domain_name               = each.value.domain_name
  region                    = each.value.region
  subject_alternative_names = each.value.subject_alternative_names
}
