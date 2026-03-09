resource "aws_lightsail_bucket_resource_access" "lightsail_bucket_resource_accesses" {
  for_each = var.lightsail_bucket_resource_accesses

  bucket_name   = each.value.bucket_name
  resource_name = each.value.resource_name
  region        = each.value.region
}
