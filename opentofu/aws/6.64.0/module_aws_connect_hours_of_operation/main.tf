resource "aws_connect_hours_of_operation" "connect_hours_of_operations" {
  for_each = var.connect_hours_of_operations

  instance_id = each.value.instance_id
  name        = each.value.name
  time_zone   = each.value.time_zone
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "config" {
    for_each = each.value.config != null ? each.value.config : []
    content {
      day = config.value.day

      dynamic "end_time" {
        for_each = config.value.end_time != null ? config.value.end_time : []
        content {
          hours   = end_time.value.hours
          minutes = end_time.value.minutes
        }
      }

      dynamic "start_time" {
        for_each = config.value.start_time != null ? config.value.start_time : []
        content {
          hours   = start_time.value.hours
          minutes = start_time.value.minutes
        }
      }
    }
  }
}
