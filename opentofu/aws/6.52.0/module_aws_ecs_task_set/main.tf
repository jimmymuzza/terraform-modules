resource "aws_ecs_task_set" "ecs_task_sets" {
  for_each = var.ecs_task_sets

  cluster                   = each.value.cluster
  service                   = each.value.service
  task_definition           = each.value.task_definition
  external_id               = each.value.external_id
  force_delete              = each.value.force_delete
  launch_type               = each.value.launch_type
  platform_version          = each.value.platform_version
  region                    = each.value.region
  tags                      = each.value.tags
  tags_all                  = each.value.tags_all
  wait_until_stable         = each.value.wait_until_stable
  wait_until_stable_timeout = each.value.wait_until_stable_timeout

  dynamic "capacity_provider_strategy" {
    for_each = each.value.capacity_provider_strategy != null ? each.value.capacity_provider_strategy : []
    content {
      capacity_provider = capacity_provider_strategy.value.capacity_provider
      weight            = capacity_provider_strategy.value.weight
      base              = capacity_provider_strategy.value.base
    }
  }

  dynamic "load_balancer" {
    for_each = each.value.load_balancer != null ? each.value.load_balancer : []
    content {
      container_name     = load_balancer.value.container_name
      container_port     = load_balancer.value.container_port
      load_balancer_name = load_balancer.value.load_balancer_name
      target_group_arn   = load_balancer.value.target_group_arn
    }
  }

  dynamic "network_configuration" {
    for_each = each.value.network_configuration != null ? each.value.network_configuration : []
    content {
      subnets          = network_configuration.value.subnets
      assign_public_ip = network_configuration.value.assign_public_ip
      security_groups  = network_configuration.value.security_groups
    }
  }

  dynamic "scale" {
    for_each = each.value.scale != null ? each.value.scale : []
    content {
      unit  = scale.value.unit
      value = scale.value.value
    }
  }

  dynamic "service_registries" {
    for_each = each.value.service_registries != null ? each.value.service_registries : []
    content {
      registry_arn   = service_registries.value.registry_arn
      container_name = service_registries.value.container_name
      container_port = service_registries.value.container_port
      port           = service_registries.value.port
    }
  }
}
