resource "aws_ec2_traffic_mirror_filter" "ec2_traffic_mirror_filters" {
  for_each = var.ec2_traffic_mirror_filters

  description      = each.value.description
  network_services = each.value.network_services
  region           = each.value.region
  tags             = each.value.tags
  tags_all         = each.value.tags_all
}
