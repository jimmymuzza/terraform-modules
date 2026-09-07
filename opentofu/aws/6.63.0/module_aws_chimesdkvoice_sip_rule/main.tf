resource "aws_chimesdkvoice_sip_rule" "chimesdkvoice_sip_rules" {
  for_each = var.chimesdkvoice_sip_rules

  name          = each.value.name
  trigger_type  = each.value.trigger_type
  trigger_value = each.value.trigger_value
  disabled      = each.value.disabled
  region        = each.value.region

  dynamic "target_applications" {
    for_each = each.value.target_applications != null ? each.value.target_applications : []
    content {
      aws_region               = target_applications.value.aws_region
      priority                 = target_applications.value.priority
      sip_media_application_id = target_applications.value.sip_media_application_id
    }
  }
}
