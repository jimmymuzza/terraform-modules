resource "aws_ssm_resource_data_sync" "ssm_resource_data_syncs" {
  for_each = var.ssm_resource_data_syncs

  name   = each.value.name
  region = each.value.region

  dynamic "s3_destination" {
    for_each = each.value.s3_destination != null ? each.value.s3_destination : []
    content {
      bucket_name = s3_destination.value.bucket_name
      region      = s3_destination.value.region
      kms_key_arn = s3_destination.value.kms_key_arn
      prefix      = s3_destination.value.prefix
      sync_format = s3_destination.value.sync_format
    }
  }
}
