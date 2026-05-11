resource "aws_ami_copy" "ami_copies" {
  for_each = var.ami_copies

  name                    = each.value.name
  source_ami_id           = each.value.source_ami_id
  source_ami_region       = each.value.source_ami_region
  deprecation_time        = each.value.deprecation_time
  description             = each.value.description
  destination_outpost_arn = each.value.destination_outpost_arn
  encrypted               = each.value.encrypted
  kms_key_id              = each.value.kms_key_id
  region                  = each.value.region
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
