resource "aws_devopsguru_event_sources_config" "devopsguru_event_sources_configs" {
  for_each = var.devopsguru_event_sources_configs

  region = each.value.region

  dynamic "event_sources" {
    for_each = each.value.event_sources != null ? each.value.event_sources : []
    content {

      dynamic "amazon_code_guru_profiler" {
        for_each = event_sources.value.amazon_code_guru_profiler != null ? event_sources.value.amazon_code_guru_profiler : []
        content {
          status = amazon_code_guru_profiler.value.status
        }
      }
    }
  }
}
