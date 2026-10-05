resource "aws_route53_zone" "route53_zones" {
  for_each = var.route53_zones

  name                        = each.value.name
  comment                     = each.value.comment
  delegation_set_id           = each.value.delegation_set_id
  enable_accelerated_recovery = each.value.enable_accelerated_recovery
  force_destroy               = each.value.force_destroy
  tags                        = each.value.tags
  tags_all                    = each.value.tags_all

  dynamic "vpc" {
    for_each = each.value.vpc != null ? each.value.vpc : []
    content {
      vpc_id     = vpc.value.vpc_id
      vpc_region = vpc.value.vpc_region
    }
  }
}
