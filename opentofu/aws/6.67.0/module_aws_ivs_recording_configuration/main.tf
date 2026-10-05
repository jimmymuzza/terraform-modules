resource "aws_ivs_recording_configuration" "ivs_recording_configurations" {
  for_each = var.ivs_recording_configurations

  name                               = each.value.name
  recording_reconnect_window_seconds = each.value.recording_reconnect_window_seconds
  region                             = each.value.region
  tags                               = each.value.tags
  tags_all                           = each.value.tags_all

  dynamic "destination_configuration" {
    for_each = each.value.destination_configuration != null ? each.value.destination_configuration : []
    content {

      dynamic "s3" {
        for_each = destination_configuration.value.s3 != null ? destination_configuration.value.s3 : []
        content {
          bucket_name = s3.value.bucket_name
        }
      }
    }
  }

  dynamic "thumbnail_configuration" {
    for_each = each.value.thumbnail_configuration != null ? each.value.thumbnail_configuration : []
    content {
      recording_mode          = thumbnail_configuration.value.recording_mode
      target_interval_seconds = thumbnail_configuration.value.target_interval_seconds
    }
  }
}
