resource "aws_lightsail_lb_attachment" "lightsail_lb_attachments" {
  for_each = var.lightsail_lb_attachments

  instance_name = each.value.instance_name
  lb_name       = each.value.lb_name
  region        = each.value.region
}
