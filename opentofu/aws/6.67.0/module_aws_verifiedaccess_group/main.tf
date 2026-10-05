resource "aws_verifiedaccess_group" "verifiedaccess_groups" {
  for_each = var.verifiedaccess_groups

  verifiedaccess_instance_id = each.value.verifiedaccess_instance_id
  description                = each.value.description
  policy_document            = each.value.policy_document
  region                     = each.value.region
  tags                       = each.value.tags
  tags_all                   = each.value.tags_all

  dynamic "sse_configuration" {
    for_each = each.value.sse_configuration != null ? each.value.sse_configuration : []
    content {
      customer_managed_key_enabled = sse_configuration.value.customer_managed_key_enabled
      kms_key_arn                  = sse_configuration.value.kms_key_arn
    }
  }
}
