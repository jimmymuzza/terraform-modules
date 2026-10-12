resource "aws_appstream_fleet" "appstream_fleets" {
  for_each = var.appstream_fleets

  instance_type                      = each.value.instance_type
  name                               = each.value.name
  description                        = each.value.description
  disconnect_timeout_in_seconds      = each.value.disconnect_timeout_in_seconds
  display_name                       = each.value.display_name
  enable_default_internet_access     = each.value.enable_default_internet_access
  fleet_type                         = each.value.fleet_type
  iam_role_arn                       = each.value.iam_role_arn
  idle_disconnect_timeout_in_seconds = each.value.idle_disconnect_timeout_in_seconds
  image_arn                          = each.value.image_arn
  image_name                         = each.value.image_name
  max_sessions_per_instance          = each.value.max_sessions_per_instance
  max_user_duration_in_seconds       = each.value.max_user_duration_in_seconds
  region                             = each.value.region
  stream_view                        = each.value.stream_view
  tags                               = each.value.tags
  tags_all                           = each.value.tags_all

  dynamic "compute_capacity" {
    for_each = each.value.compute_capacity != null ? each.value.compute_capacity : []
    content {
      desired_instances = compute_capacity.value.desired_instances
      desired_sessions  = compute_capacity.value.desired_sessions
    }
  }

  dynamic "domain_join_info" {
    for_each = each.value.domain_join_info != null ? each.value.domain_join_info : []
    content {
      directory_name                         = domain_join_info.value.directory_name
      organizational_unit_distinguished_name = domain_join_info.value.organizational_unit_distinguished_name
    }
  }

  dynamic "vpc_config" {
    for_each = each.value.vpc_config != null ? each.value.vpc_config : []
    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnet_ids         = vpc_config.value.subnet_ids
    }
  }
}
