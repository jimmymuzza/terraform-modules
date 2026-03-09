resource "aws_location_tracker" "location_trackers" {
  for_each = var.location_trackers

  tracker_name       = each.value.tracker_name
  description        = each.value.description
  kms_key_id         = each.value.kms_key_id
  position_filtering = each.value.position_filtering
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all
}
