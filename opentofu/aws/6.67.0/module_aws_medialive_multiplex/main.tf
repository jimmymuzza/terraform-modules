resource "aws_medialive_multiplex" "medialive_multiplexes" {
  for_each = var.medialive_multiplexes

  availability_zones = each.value.availability_zones
  name               = each.value.name
  region             = each.value.region
  start_multiplex    = each.value.start_multiplex
  tags               = each.value.tags
  tags_all           = each.value.tags_all

  dynamic "multiplex_settings" {
    for_each = each.value.multiplex_settings != null ? each.value.multiplex_settings : []
    content {
      transport_stream_bitrate                = multiplex_settings.value.transport_stream_bitrate
      transport_stream_id                     = multiplex_settings.value.transport_stream_id
      maximum_video_buffer_delay_milliseconds = multiplex_settings.value.maximum_video_buffer_delay_milliseconds
      transport_stream_reserved_bitrate       = multiplex_settings.value.transport_stream_reserved_bitrate
    }
  }
}
