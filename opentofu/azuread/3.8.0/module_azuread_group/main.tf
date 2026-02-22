resource "azuread_group" "groups" {
  for_each = var.groups

  display_name               = each.value.display_name
  administrative_unit_ids    = each.value.administrative_unit_ids
  assignable_to_role         = each.value.assignable_to_role
  auto_subscribe_new_members = each.value.auto_subscribe_new_members
  behaviors                  = each.value.behaviors
  description                = each.value.description
  external_senders_allowed   = each.value.external_senders_allowed
  hide_from_address_lists    = each.value.hide_from_address_lists
  hide_from_outlook_clients  = each.value.hide_from_outlook_clients
  mail_enabled               = each.value.mail_enabled
  mail_nickname              = each.value.mail_nickname
  members                    = each.value.members
  onpremises_group_type      = each.value.onpremises_group_type
  owners                     = each.value.owners
  prevent_duplicate_names    = each.value.prevent_duplicate_names
  provisioning_options       = each.value.provisioning_options
  security_enabled           = each.value.security_enabled
  theme                      = each.value.theme
  types                      = each.value.types
  visibility                 = each.value.visibility
  writeback_enabled          = each.value.writeback_enabled

  dynamic "dynamic_membership" {
    for_each = each.value.dynamic_membership != null ? each.value.dynamic_membership : []
    content {
      enabled = dynamic_membership.value.enabled
      rule    = dynamic_membership.value.rule
    }
  }
}
