resource "aws_ami_from_instance" "ami_from_instances" {
  for_each = var.ami_from_instances

  name                    = each.value.name
  source_instance_id      = each.value.source_instance_id
  deprecation_time        = each.value.deprecation_time
  description             = each.value.description
  region                  = each.value.region
  snapshot_without_reboot = each.value.snapshot_without_reboot
  tags                    = each.value.tags
  tags_all                = each.value.tags_all

  dynamic "ebs_block_device" {
    for_each = each.value.ebs_block_device != null ? each.value.ebs_block_device : []
    content {
    }
  }

  dynamic "ephemeral_block_device" {
    for_each = each.value.ephemeral_block_device != null ? each.value.ephemeral_block_device : []
    content {
    }
  }
}
