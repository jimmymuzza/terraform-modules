resource "aws_volume_attachment" "volume_attachments" {
  for_each = var.volume_attachments

  device_name                    = each.value.device_name
  instance_id                    = each.value.instance_id
  volume_id                      = each.value.volume_id
  force_detach                   = each.value.force_detach
  region                         = each.value.region
  skip_destroy                   = each.value.skip_destroy
  stop_instance_before_detaching = each.value.stop_instance_before_detaching
}
