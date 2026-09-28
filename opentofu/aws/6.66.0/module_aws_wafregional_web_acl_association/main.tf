resource "aws_wafregional_web_acl_association" "wafregional_web_acl_associations" {
  for_each = var.wafregional_web_acl_associations

  resource_arn = each.value.resource_arn
  web_acl_id   = each.value.web_acl_id
  region       = each.value.region
}
