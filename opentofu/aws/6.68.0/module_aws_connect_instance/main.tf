resource "aws_connect_instance" "connect_instances" {
  for_each = var.connect_instances

  identity_management_type         = each.value.identity_management_type
  inbound_calls_enabled            = each.value.inbound_calls_enabled
  outbound_calls_enabled           = each.value.outbound_calls_enabled
  auto_resolve_best_voices_enabled = each.value.auto_resolve_best_voices_enabled
  contact_flow_logs_enabled        = each.value.contact_flow_logs_enabled
  contact_lens_enabled             = each.value.contact_lens_enabled
  directory_id                     = each.value.directory_id
  early_media_enabled              = each.value.early_media_enabled
  instance_alias                   = each.value.instance_alias
  multi_party_conference_enabled   = each.value.multi_party_conference_enabled
  region                           = each.value.region
  tags                             = each.value.tags
  tags_all                         = each.value.tags_all
}
