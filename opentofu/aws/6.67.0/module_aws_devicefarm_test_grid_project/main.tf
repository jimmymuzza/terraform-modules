resource "aws_devicefarm_test_grid_project" "devicefarm_test_grid_projects" {
  for_each = var.devicefarm_test_grid_projects

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "vpc_config" {
    for_each = each.value.vpc_config != null ? each.value.vpc_config : []
    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnet_ids         = vpc_config.value.subnet_ids
      vpc_id             = vpc_config.value.vpc_id
    }
  }
}
