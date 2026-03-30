resource "aws_autoscaling_schedule" "autoscaling_schedules" {
  for_each = var.autoscaling_schedules

  autoscaling_group_name = each.value.autoscaling_group_name
  scheduled_action_name  = each.value.scheduled_action_name
  desired_capacity       = each.value.desired_capacity
  end_time               = each.value.end_time
  max_size               = each.value.max_size
  min_size               = each.value.min_size
  recurrence             = each.value.recurrence
  region                 = each.value.region
  start_time             = each.value.start_time
  time_zone              = each.value.time_zone
}
