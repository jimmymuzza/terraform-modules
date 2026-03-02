resource "aws_location_tracker_association" "location_tracker_associations" {
  for_each = var.location_tracker_associations

  consumer_arn = each.value.consumer_arn
  tracker_name = each.value.tracker_name
  region       = each.value.region
}
