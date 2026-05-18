resource "aws_redshift_snapshot_schedule" "redshift_snapshot_schedules" {
  for_each = var.redshift_snapshot_schedules

  definitions       = each.value.definitions
  description       = each.value.description
  force_destroy     = each.value.force_destroy
  identifier        = each.value.identifier
  identifier_prefix = each.value.identifier_prefix
  region            = each.value.region
  tags              = each.value.tags
  tags_all          = each.value.tags_all
}
