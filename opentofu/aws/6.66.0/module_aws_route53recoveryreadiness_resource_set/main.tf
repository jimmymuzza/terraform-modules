resource "aws_route53recoveryreadiness_resource_set" "route53recoveryreadiness_resource_sets" {
  for_each = var.route53recoveryreadiness_resource_sets

  resource_set_name = each.value.resource_set_name
  resource_set_type = each.value.resource_set_type
  tags              = each.value.tags
  tags_all          = each.value.tags_all

  dynamic "resources" {
    for_each = each.value.resources != null ? each.value.resources : []
    content {
      readiness_scopes = resources.value.readiness_scopes
      resource_arn     = resources.value.resource_arn

      dynamic "dns_target_resource" {
        for_each = resources.value.dns_target_resource != null ? resources.value.dns_target_resource : []
        content {
          domain_name     = dns_target_resource.value.domain_name
          hosted_zone_arn = dns_target_resource.value.hosted_zone_arn
          record_set_id   = dns_target_resource.value.record_set_id
          record_type     = dns_target_resource.value.record_type

          dynamic "target_resource" {
            for_each = dns_target_resource.value.target_resource != null ? dns_target_resource.value.target_resource : []
            content {

              dynamic "nlb_resource" {
                for_each = target_resource.value.nlb_resource != null ? target_resource.value.nlb_resource : []
                content {
                  arn = nlb_resource.value.arn
                }
              }

              dynamic "r53_resource" {
                for_each = target_resource.value.r53_resource != null ? target_resource.value.r53_resource : []
                content {
                  domain_name   = r53_resource.value.domain_name
                  record_set_id = r53_resource.value.record_set_id
                }
              }
            }
          }
        }
      }
    }
  }
}
