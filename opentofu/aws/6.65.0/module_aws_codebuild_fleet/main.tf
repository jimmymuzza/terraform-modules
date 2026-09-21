resource "aws_codebuild_fleet" "codebuild_fleets" {
  for_each = var.codebuild_fleets

  base_capacity      = each.value.base_capacity
  compute_type       = each.value.compute_type
  environment_type   = each.value.environment_type
  name               = each.value.name
  fleet_service_role = each.value.fleet_service_role
  image_id           = each.value.image_id
  overflow_behavior  = each.value.overflow_behavior
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all

  dynamic "compute_configuration" {
    for_each = each.value.compute_configuration != null ? each.value.compute_configuration : []
    content {
      disk          = compute_configuration.value.disk
      instance_type = compute_configuration.value.instance_type
      machine_type  = compute_configuration.value.machine_type
      memory        = compute_configuration.value.memory
      vcpu          = compute_configuration.value.vcpu
    }
  }

  dynamic "scaling_configuration" {
    for_each = each.value.scaling_configuration != null ? each.value.scaling_configuration : []
    content {
      max_capacity = scaling_configuration.value.max_capacity
      scaling_type = scaling_configuration.value.scaling_type

      dynamic "target_tracking_scaling_configs" {
        for_each = scaling_configuration.value.target_tracking_scaling_configs != null ? scaling_configuration.value.target_tracking_scaling_configs : []
        content {
          metric_type  = target_tracking_scaling_configs.value.metric_type
          target_value = target_tracking_scaling_configs.value.target_value
        }
      }
    }
  }

  dynamic "vpc_config" {
    for_each = each.value.vpc_config != null ? each.value.vpc_config : []
    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnets            = vpc_config.value.subnets
      vpc_id             = vpc_config.value.vpc_id
    }
  }
}
