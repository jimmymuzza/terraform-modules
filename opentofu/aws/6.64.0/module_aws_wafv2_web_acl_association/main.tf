resource "aws_wafv2_web_acl_association" "wafv2_web_acl_associations" {
  for_each = var.wafv2_web_acl_associations

  resource_arn = each.value.resource_arn
  web_acl_arn  = each.value.web_acl_arn
  region       = each.value.region
}
