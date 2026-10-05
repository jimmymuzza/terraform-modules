resource "aws_location_geofence_collection" "location_geofence_collections" {
  for_each = var.location_geofence_collections

  collection_name = each.value.collection_name
  description     = each.value.description
  kms_key_id      = each.value.kms_key_id
  region          = each.value.region
  tags            = each.value.tags
  tags_all        = each.value.tags_all
}
