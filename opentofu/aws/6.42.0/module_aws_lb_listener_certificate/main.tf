resource "aws_lb_listener_certificate" "lb_listener_certificates" {
  for_each = var.lb_listener_certificates

  certificate_arn = each.value.certificate_arn
  listener_arn    = each.value.listener_arn
  region          = each.value.region
}
