resource "aws_lightsail_bucket" "lightsail_buckets" {
  for_each = var.lightsail_buckets

  bundle_id    = each.value.bundle_id
  name         = each.value.name
  force_delete = each.value.force_delete
  region       = each.value.region
  tags         = each.value.tags
  tags_all     = each.value.tags_all
}
