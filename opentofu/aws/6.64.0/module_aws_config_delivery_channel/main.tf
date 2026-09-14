resource "aws_config_delivery_channel" "config_delivery_channels" {
  for_each = var.config_delivery_channels

  s3_bucket_name = each.value.s3_bucket_name
  name           = each.value.name
  region         = each.value.region
  s3_key_prefix  = each.value.s3_key_prefix
  s3_kms_key_arn = each.value.s3_kms_key_arn
  sns_topic_arn  = each.value.sns_topic_arn

  dynamic "snapshot_delivery_properties" {
    for_each = each.value.snapshot_delivery_properties != null ? each.value.snapshot_delivery_properties : []
    content {
      delivery_frequency = snapshot_delivery_properties.value.delivery_frequency
    }
  }
}
