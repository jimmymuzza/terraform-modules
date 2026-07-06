resource "aws_media_store_container_policy" "media_store_container_policies" {
  for_each = var.media_store_container_policies

  container_name = each.value.container_name
  policy         = each.value.policy
  region         = each.value.region
}
