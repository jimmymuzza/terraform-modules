resource "aws_cloudfront_anycast_ip_list" "cloudfront_anycast_ip_lists" {
  for_each = var.cloudfront_anycast_ip_lists

  ip_count = each.value.ip_count
  name     = each.value.name
  tags     = each.value.tags
}
