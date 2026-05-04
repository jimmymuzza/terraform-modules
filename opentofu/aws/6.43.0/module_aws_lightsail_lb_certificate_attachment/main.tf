resource "aws_lightsail_lb_certificate_attachment" "lightsail_lb_certificate_attachments" {
  for_each = var.lightsail_lb_certificate_attachments

  certificate_name = each.value.certificate_name
  lb_name          = each.value.lb_name
  region           = each.value.region
}
