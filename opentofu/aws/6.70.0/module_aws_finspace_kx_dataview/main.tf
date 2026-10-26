resource "aws_finspace_kx_dataview" "finspace_kx_dataviews" {
  for_each = var.finspace_kx_dataviews

  auto_update          = each.value.auto_update
  az_mode              = each.value.az_mode
  database_name        = each.value.database_name
  environment_id       = each.value.environment_id
  name                 = each.value.name
  availability_zone_id = each.value.availability_zone_id
  changeset_id         = each.value.changeset_id
  description          = each.value.description
  read_write           = each.value.read_write
  region               = each.value.region
  tags                 = each.value.tags
  tags_all             = each.value.tags_all

  dynamic "segment_configurations" {
    for_each = each.value.segment_configurations != null ? each.value.segment_configurations : []
    content {
      db_paths    = segment_configurations.value.db_paths
      volume_name = segment_configurations.value.volume_name
      on_demand   = segment_configurations.value.on_demand
    }
  }
}
