resource "aws_media_convert_queue" "media_convert_queues" {
  for_each = var.media_convert_queues

  name            = each.value.name
  concurrent_jobs = each.value.concurrent_jobs
  description     = each.value.description
  pricing_plan    = each.value.pricing_plan
  region          = each.value.region
  status          = each.value.status
  tags            = each.value.tags
  tags_all        = each.value.tags_all

  dynamic "reservation_plan_settings" {
    for_each = each.value.reservation_plan_settings != null ? each.value.reservation_plan_settings : []
    content {
      commitment     = reservation_plan_settings.value.commitment
      renewal_type   = reservation_plan_settings.value.renewal_type
      reserved_slots = reservation_plan_settings.value.reserved_slots
    }
  }
}
