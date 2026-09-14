resource "aws_scheduler_schedule_group" "scheduler_schedule_groups" {
  for_each = var.scheduler_schedule_groups

  name        = each.value.name
  name_prefix = each.value.name_prefix
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
