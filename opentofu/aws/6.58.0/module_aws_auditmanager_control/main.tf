resource "aws_auditmanager_control" "auditmanager_controls" {
  for_each = var.auditmanager_controls

  name                     = each.value.name
  action_plan_instructions = each.value.action_plan_instructions
  action_plan_title        = each.value.action_plan_title
  description              = each.value.description
  region                   = each.value.region
  tags                     = each.value.tags
  testing_information      = each.value.testing_information

  dynamic "control_mapping_sources" {
    for_each = each.value.control_mapping_sources != null ? each.value.control_mapping_sources : []
    content {
      source_name          = control_mapping_sources.value.source_name
      source_set_up_option = control_mapping_sources.value.source_set_up_option
      source_type          = control_mapping_sources.value.source_type
      source_description   = control_mapping_sources.value.source_description
      source_frequency     = control_mapping_sources.value.source_frequency
      source_keyword       = control_mapping_sources.value.source_keyword
      troubleshooting_text = control_mapping_sources.value.troubleshooting_text
    }
  }
}
