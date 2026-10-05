resource "aws_gamelift_build" "gamelift_builds" {
  for_each = var.gamelift_builds

  name             = each.value.name
  operating_system = each.value.operating_system
  region           = each.value.region
  tags             = each.value.tags
  tags_all         = each.value.tags_all
  version          = each.value.version

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
