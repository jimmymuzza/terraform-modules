resource "aws_imagebuilder_image_recipe" "imagebuilder_image_recipes" {
  for_each = var.imagebuilder_image_recipes

  name              = each.value.name
  parent_image      = each.value.parent_image
  version           = each.value.version
  ami_tags          = each.value.ami_tags
  description       = each.value.description
  region            = each.value.region
  tags              = each.value.tags
  tags_all          = each.value.tags_all
  user_data_base64  = each.value.user_data_base64
  working_directory = each.value.working_directory

  dynamic "block_device_mapping" {
    for_each = each.value.block_device_mapping != null ? each.value.block_device_mapping : []
    content {
      device_name  = block_device_mapping.value.device_name
      no_device    = block_device_mapping.value.no_device
      virtual_name = block_device_mapping.value.virtual_name

      dynamic "ebs" {
        for_each = block_device_mapping.value.ebs != null ? block_device_mapping.value.ebs : []
        content {
          delete_on_termination = ebs.value.delete_on_termination
          encrypted             = ebs.value.encrypted
          iops                  = ebs.value.iops
          kms_key_id            = ebs.value.kms_key_id
          snapshot_id           = ebs.value.snapshot_id
          throughput            = ebs.value.throughput
          volume_size           = ebs.value.volume_size
          volume_type           = ebs.value.volume_type
        }
      }
    }
  }

  dynamic "component" {
    for_each = each.value.component != null ? each.value.component : []
    content {
      component_arn = component.value.component_arn

      dynamic "parameter" {
        for_each = component.value.parameter != null ? component.value.parameter : []
        content {
          name  = parameter.value.name
          value = parameter.value.value
        }
      }
    }
  }

  dynamic "systems_manager_agent" {
    for_each = each.value.systems_manager_agent != null ? each.value.systems_manager_agent : []
    content {
      uninstall_after_build = systems_manager_agent.value.uninstall_after_build
    }
  }
}
