resource "aws_kinesis_video_stream" "kinesis_video_streams" {
  for_each = var.kinesis_video_streams

  name                    = each.value.name
  data_retention_in_hours = each.value.data_retention_in_hours
  device_name             = each.value.device_name
  kms_key_id              = each.value.kms_key_id
  media_type              = each.value.media_type
  region                  = each.value.region
  tags                    = each.value.tags
  tags_all                = each.value.tags_all
}
