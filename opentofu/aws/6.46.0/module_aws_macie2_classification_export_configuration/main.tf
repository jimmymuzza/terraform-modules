resource "aws_macie2_classification_export_configuration" "macie2_classification_export_configurations" {
  for_each = var.macie2_classification_export_configurations

  region = each.value.region

  dynamic "s3_destination" {
    for_each = each.value.s3_destination != null ? each.value.s3_destination : []
    content {
      bucket_name = s3_destination.value.bucket_name
      kms_key_arn = s3_destination.value.kms_key_arn
      key_prefix  = s3_destination.value.key_prefix
    }
  }
}
