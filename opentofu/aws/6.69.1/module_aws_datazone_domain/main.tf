resource "aws_datazone_domain" "datazone_domains" {
  for_each = var.datazone_domains

  domain_execution_role = each.value.domain_execution_role
  name                  = each.value.name
  description           = each.value.description
  domain_version        = each.value.domain_version
  kms_key_identifier    = each.value.kms_key_identifier
  region                = each.value.region
  service_role          = each.value.service_role
  skip_deletion_check   = each.value.skip_deletion_check
  tags                  = each.value.tags

  dynamic "single_sign_on" {
    for_each = each.value.single_sign_on != null ? each.value.single_sign_on : []
    content {
      type            = single_sign_on.value.type
      user_assignment = single_sign_on.value.user_assignment
    }
  }
}
