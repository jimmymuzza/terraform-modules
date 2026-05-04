resource "aws_finspace_kx_scaling_group" "finspace_kx_scaling_groups" {
  for_each = var.finspace_kx_scaling_groups

  availability_zone_id = each.value.availability_zone_id
  environment_id       = each.value.environment_id
  host_type            = each.value.host_type
  name                 = each.value.name
  region               = each.value.region
  tags                 = each.value.tags
  tags_all             = each.value.tags_all
}
