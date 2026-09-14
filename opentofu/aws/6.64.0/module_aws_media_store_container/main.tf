resource "aws_media_store_container" "media_store_containers" {
  for_each = var.media_store_containers

  name     = each.value.name
  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all
}
