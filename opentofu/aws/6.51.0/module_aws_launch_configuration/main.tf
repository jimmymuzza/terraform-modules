resource "aws_launch_configuration" "launch_configurations" {
  for_each = var.launch_configurations

  image_id                    = each.value.image_id
  instance_type               = each.value.instance_type
  associate_public_ip_address = each.value.associate_public_ip_address
  ebs_optimized               = each.value.ebs_optimized
  enable_monitoring           = each.value.enable_monitoring
  iam_instance_profile        = each.value.iam_instance_profile
  key_name                    = each.value.key_name
  name                        = each.value.name
  name_prefix                 = each.value.name_prefix
  placement_tenancy           = each.value.placement_tenancy
  region                      = each.value.region
  security_groups             = each.value.security_groups
  spot_price                  = each.value.spot_price
  user_data                   = each.value.user_data
  user_data_base64            = each.value.user_data_base64

  dynamic "ebs_block_device" {
    for_each = each.value.ebs_block_device != null ? each.value.ebs_block_device : []
    content {
      device_name           = ebs_block_device.value.device_name
      delete_on_termination = ebs_block_device.value.delete_on_termination
      encrypted             = ebs_block_device.value.encrypted
      iops                  = ebs_block_device.value.iops
      no_device             = ebs_block_device.value.no_device
      snapshot_id           = ebs_block_device.value.snapshot_id
      throughput            = ebs_block_device.value.throughput
      volume_size           = ebs_block_device.value.volume_size
      volume_type           = ebs_block_device.value.volume_type
    }
  }

  dynamic "ephemeral_block_device" {
    for_each = each.value.ephemeral_block_device != null ? each.value.ephemeral_block_device : []
    content {
      device_name  = ephemeral_block_device.value.device_name
      no_device    = ephemeral_block_device.value.no_device
      virtual_name = ephemeral_block_device.value.virtual_name
    }
  }

  dynamic "metadata_options" {
    for_each = each.value.metadata_options != null ? each.value.metadata_options : []
    content {
      http_endpoint               = metadata_options.value.http_endpoint
      http_put_response_hop_limit = metadata_options.value.http_put_response_hop_limit
      http_tokens                 = metadata_options.value.http_tokens
    }
  }

  dynamic "root_block_device" {
    for_each = each.value.root_block_device != null ? each.value.root_block_device : []
    content {
      delete_on_termination = root_block_device.value.delete_on_termination
      encrypted             = root_block_device.value.encrypted
      iops                  = root_block_device.value.iops
      throughput            = root_block_device.value.throughput
      volume_size           = root_block_device.value.volume_size
      volume_type           = root_block_device.value.volume_type
    }
  }
}
