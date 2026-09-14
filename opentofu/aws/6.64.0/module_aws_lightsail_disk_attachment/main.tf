resource "aws_lightsail_disk_attachment" "lightsail_disk_attachments" {
  for_each = var.lightsail_disk_attachments

  disk_name     = each.value.disk_name
  disk_path     = each.value.disk_path
  instance_name = each.value.instance_name
  region        = each.value.region
}
