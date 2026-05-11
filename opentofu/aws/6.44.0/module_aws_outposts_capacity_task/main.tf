resource "aws_outposts_capacity_task" "outposts_capacity_tasks" {
  for_each = var.outposts_capacity_tasks

  outpost_identifier                = each.value.outpost_identifier
  asset_id                          = each.value.asset_id
  order_id                          = each.value.order_id
  region                            = each.value.region
  task_action_on_blocking_instances = each.value.task_action_on_blocking_instances

  dynamic "instance_pool" {
    for_each = each.value.instance_pool != null ? each.value.instance_pool : []
    content {
      count         = instance_pool.value.count
      instance_type = instance_pool.value.instance_type
    }
  }

  dynamic "instances_to_exclude" {
    for_each = each.value.instances_to_exclude != null ? each.value.instances_to_exclude : []
    content {
      instances = instances_to_exclude.value.instances
    }
  }
}
