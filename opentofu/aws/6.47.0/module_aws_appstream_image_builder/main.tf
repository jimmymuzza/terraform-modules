resource "aws_appstream_image_builder" "appstream_image_builders" {
  for_each = var.appstream_image_builders

  instance_type                  = each.value.instance_type
  name                           = each.value.name
  appstream_agent_version        = each.value.appstream_agent_version
  description                    = each.value.description
  display_name                   = each.value.display_name
  enable_default_internet_access = each.value.enable_default_internet_access
  iam_role_arn                   = each.value.iam_role_arn
  image_arn                      = each.value.image_arn
  image_name                     = each.value.image_name
  region                         = each.value.region
  tags                           = each.value.tags
  tags_all                       = each.value.tags_all

  dynamic "access_endpoint" {
    for_each = each.value.access_endpoint != null ? each.value.access_endpoint : []
    content {
      endpoint_type = access_endpoint.value.endpoint_type
      vpce_id       = access_endpoint.value.vpce_id
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
