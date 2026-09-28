resource "aws_lightsail_static_ip" "lightsail_static_ips" {
  for_each = var.lightsail_static_ips

  name   = each.value.name
  region = each.value.region
}
