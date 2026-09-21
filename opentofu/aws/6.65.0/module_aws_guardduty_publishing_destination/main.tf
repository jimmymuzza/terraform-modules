resource "aws_guardduty_publishing_destination" "guardduty_publishing_destinations" {
  for_each = var.guardduty_publishing_destinations

  destination_arn  = each.value.destination_arn
  detector_id      = each.value.detector_id
  kms_key_arn      = each.value.kms_key_arn
  destination_type = each.value.destination_type
  region           = each.value.region
  tags             = each.value.tags
  tags_all         = each.value.tags_all
}
