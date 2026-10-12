resource "aws_gamelift_script" "gamelift_scripts" {
  for_each = var.gamelift_scripts

  name     = each.value.name
  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all
  version  = each.value.version
  zip_file = each.value.zip_file

  dynamic "storage_location" {
    for_each = each.value.storage_location != null ? each.value.storage_location : []
    content {
      bucket         = storage_location.value.bucket
      key            = storage_location.value.key
      role_arn       = storage_location.value.role_arn
      object_version = storage_location.value.object_version
    }
  }
}
