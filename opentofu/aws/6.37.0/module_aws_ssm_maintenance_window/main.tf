resource "aws_ssm_maintenance_window" "ssm_maintenance_windows" {
  for_each = var.ssm_maintenance_windows

  cutoff                     = each.value.cutoff
  duration                   = each.value.duration
  name                       = each.value.name
  schedule                   = each.value.schedule
  allow_unassociated_targets = each.value.allow_unassociated_targets
  description                = each.value.description
  enabled                    = each.value.enabled
  end_date                   = each.value.end_date
  region                     = each.value.region
  schedule_offset            = each.value.schedule_offset
  schedule_timezone          = each.value.schedule_timezone
  start_date                 = each.value.start_date
  tags                       = each.value.tags
  tags_all                   = each.value.tags_all
}
