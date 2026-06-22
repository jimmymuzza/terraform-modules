resource "aws_batch_job_queue" "batch_job_queues" {
  for_each = var.batch_job_queues

  name                  = each.value.name
  priority              = each.value.priority
  state                 = each.value.state
  region                = each.value.region
  scheduling_policy_arn = each.value.scheduling_policy_arn
  tags                  = each.value.tags

  dynamic "compute_environment_order" {
    for_each = each.value.compute_environment_order != null ? each.value.compute_environment_order : []
    content {
      compute_environment = compute_environment_order.value.compute_environment
      order               = compute_environment_order.value.order
    }
  }

  dynamic "job_state_time_limit_action" {
    for_each = each.value.job_state_time_limit_action != null ? each.value.job_state_time_limit_action : []
    content {
      action           = job_state_time_limit_action.value.action
      max_time_seconds = job_state_time_limit_action.value.max_time_seconds
      reason           = job_state_time_limit_action.value.reason
      state            = job_state_time_limit_action.value.state
    }
  }
}
