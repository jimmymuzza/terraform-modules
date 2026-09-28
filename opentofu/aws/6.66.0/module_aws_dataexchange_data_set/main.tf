resource "aws_dataexchange_data_set" "dataexchange_data_sets" {
  for_each = var.dataexchange_data_sets

  asset_type  = each.value.asset_type
  description = each.value.description
  name        = each.value.name
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
