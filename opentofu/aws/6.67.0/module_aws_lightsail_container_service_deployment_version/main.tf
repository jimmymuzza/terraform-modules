resource "aws_lightsail_container_service_deployment_version" "lightsail_container_service_deployment_versions" {
  for_each = var.lightsail_container_service_deployment_versions

  service_name = each.value.service_name
  region       = each.value.region

  dynamic "container" {
    for_each = each.value.container != null ? each.value.container : []
    content {
      container_name = container.value.container_name
      image          = container.value.image
      command        = container.value.command
      environment    = container.value.environment
      ports          = container.value.ports
    }
  }

  dynamic "public_endpoint" {
    for_each = each.value.public_endpoint != null ? each.value.public_endpoint : []
    content {
      container_name = public_endpoint.value.container_name
      container_port = public_endpoint.value.container_port

      dynamic "health_check" {
        for_each = public_endpoint.value.health_check != null ? public_endpoint.value.health_check : []
        content {
          healthy_threshold   = health_check.value.healthy_threshold
          interval_seconds    = health_check.value.interval_seconds
          path                = health_check.value.path
          success_codes       = health_check.value.success_codes
          timeout_seconds     = health_check.value.timeout_seconds
          unhealthy_threshold = health_check.value.unhealthy_threshold
        }
      }
    }
  }
}
