resource "aws_mskconnect_custom_plugin" "mskconnect_custom_plugins" {
  for_each = var.mskconnect_custom_plugins

  content_type = each.value.content_type
  name         = each.value.name
  description  = each.value.description
  region       = each.value.region
  tags         = each.value.tags
  tags_all     = each.value.tags_all

  dynamic "location" {
    for_each = each.value.location != null ? each.value.location : []
    content {

      dynamic "s3" {
        for_each = location.value.s3 != null ? location.value.s3 : []
        content {
          bucket_arn     = s3.value.bucket_arn
          file_key       = s3.value.file_key
          object_version = s3.value.object_version
        }
      }
    }
  }
}
