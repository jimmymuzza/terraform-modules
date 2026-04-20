resource "aws_redshiftserverless_workgroup" "redshiftserverless_workgroups" {
  for_each = var.redshiftserverless_workgroups

  namespace_name       = each.value.namespace_name
  workgroup_name       = each.value.workgroup_name
  base_capacity        = each.value.base_capacity
  enhanced_vpc_routing = each.value.enhanced_vpc_routing
  max_capacity         = each.value.max_capacity
  port                 = each.value.port
  publicly_accessible  = each.value.publicly_accessible
  region               = each.value.region
  security_group_ids   = each.value.security_group_ids
  subnet_ids           = each.value.subnet_ids
  tags                 = each.value.tags
  tags_all             = each.value.tags_all
  track_name           = each.value.track_name

  dynamic "config_parameter" {
    for_each = each.value.config_parameter != null ? each.value.config_parameter : []
    content {
      parameter_key   = config_parameter.value.parameter_key
      parameter_value = config_parameter.value.parameter_value
    }
  }

  dynamic "price_performance_target" {
    for_each = each.value.price_performance_target != null ? each.value.price_performance_target : []
    content {
      enabled = price_performance_target.value.enabled
      level   = price_performance_target.value.level
    }
  }
}
