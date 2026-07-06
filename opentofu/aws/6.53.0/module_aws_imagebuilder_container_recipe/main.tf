resource "aws_imagebuilder_container_recipe" "imagebuilder_container_recipes" {
  for_each = var.imagebuilder_container_recipes

  container_type           = each.value.container_type
  name                     = each.value.name
  parent_image             = each.value.parent_image
  version                  = each.value.version
  description              = each.value.description
  dockerfile_template_data = each.value.dockerfile_template_data
  dockerfile_template_uri  = each.value.dockerfile_template_uri
  kms_key_id               = each.value.kms_key_id
  platform_override        = each.value.platform_override
  region                   = each.value.region
  tags                     = each.value.tags
  tags_all                 = each.value.tags_all
  working_directory        = each.value.working_directory

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

  dynamic "instance_configuration" {
    for_each = each.value.instance_configuration != null ? each.value.instance_configuration : []
    content {
      image = instance_configuration.value.image

      dynamic "block_device_mapping" {
        for_each = instance_configuration.value.block_device_mapping != null ? instance_configuration.value.block_device_mapping : []
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
    }
  }

  dynamic "target_repository" {
    for_each = each.value.target_repository != null ? each.value.target_repository : []
    content {
      repository_name = target_repository.value.repository_name
      service         = target_repository.value.service
    }
  }
}
