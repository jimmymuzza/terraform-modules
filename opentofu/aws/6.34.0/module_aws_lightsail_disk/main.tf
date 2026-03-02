resource "aws_lightsail_disk" "lightsail_disks" {
  for_each = var.lightsail_disks

  availability_zone = each.value.availability_zone
  name              = each.value.name
  size_in_gb        = each.value.size_in_gb
  region            = each.value.region
  tags              = each.value.tags
  tags_all          = each.value.tags_all
}
