resource "aws_lightsail_lb" "lightsail_lbs" {
  for_each = var.lightsail_lbs

  instance_port     = each.value.instance_port
  name              = each.value.name
  health_check_path = each.value.health_check_path
  ip_address_type   = each.value.ip_address_type
  region            = each.value.region
  tags              = each.value.tags
  tags_all          = each.value.tags_all
}
