resource "aws_alb_listener_certificate" "alb_listener_certificates" {
  for_each = var.alb_listener_certificates

  certificate_arn = each.value.certificate_arn
  listener_arn    = each.value.listener_arn
  region          = each.value.region
}
