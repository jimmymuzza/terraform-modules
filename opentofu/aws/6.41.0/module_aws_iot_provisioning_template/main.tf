resource "aws_iot_provisioning_template" "iot_provisioning_templates" {
  for_each = var.iot_provisioning_templates

  name                  = each.value.name
  provisioning_role_arn = each.value.provisioning_role_arn
  template_body         = each.value.template_body
  description           = each.value.description
  enabled               = each.value.enabled
  region                = each.value.region
  tags                  = each.value.tags
  tags_all              = each.value.tags_all
  type                  = each.value.type

  dynamic "pre_provisioning_hook" {
    for_each = each.value.pre_provisioning_hook != null ? each.value.pre_provisioning_hook : []
    content {
      target_arn      = pre_provisioning_hook.value.target_arn
      payload_version = pre_provisioning_hook.value.payload_version
    }
  }
}
