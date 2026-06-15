resource "aws_lightsail_bucket_access_key" "lightsail_bucket_access_keys" {
  for_each = var.lightsail_bucket_access_keys

  bucket_name = each.value.bucket_name
  region      = each.value.region
}
