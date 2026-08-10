resource "aws_ecs_cluster_capacity_providers" "ecs_cluster_capacity_providers" {
  for_each = var.ecs_cluster_capacity_providers

  cluster_name       = each.value.cluster_name
  capacity_providers = each.value.capacity_providers
  region             = each.value.region

  dynamic "default_capacity_provider_strategy" {
    for_each = each.value.default_capacity_provider_strategy != null ? each.value.default_capacity_provider_strategy : []
    content {
      capacity_provider = default_capacity_provider_strategy.value.capacity_provider
      base              = default_capacity_provider_strategy.value.base
      weight            = default_capacity_provider_strategy.value.weight
    }
  }
}
