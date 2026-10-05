resource "aws_lightsail_static_ip_attachment" "lightsail_static_ip_attachments" {
  for_each = var.lightsail_static_ip_attachments

  instance_name  = each.value.instance_name
  static_ip_name = each.value.static_ip_name
  region         = each.value.region
}
