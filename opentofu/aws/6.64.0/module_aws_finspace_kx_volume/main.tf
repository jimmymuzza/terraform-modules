resource "aws_finspace_kx_volume" "finspace_kx_volumes" {
  for_each = var.finspace_kx_volumes

  availability_zones = each.value.availability_zones
  az_mode            = each.value.az_mode
  environment_id     = each.value.environment_id
  name               = each.value.name
  type               = each.value.type
  description        = each.value.description
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all

  dynamic "nas1_configuration" {
    for_each = each.value.nas1_configuration != null ? each.value.nas1_configuration : []
    content {
      size = nas1_configuration.value.size
      type = nas1_configuration.value.type
    }
  }
}
