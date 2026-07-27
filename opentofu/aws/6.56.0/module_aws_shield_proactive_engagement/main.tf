resource "aws_shield_proactive_engagement" "shield_proactive_engagements" {
  for_each = var.shield_proactive_engagements

  enabled = each.value.enabled

  dynamic "emergency_contact" {
    for_each = each.value.emergency_contact != null ? each.value.emergency_contact : []
    content {
      email_address = emergency_contact.value.email_address
      contact_notes = emergency_contact.value.contact_notes
      phone_number  = emergency_contact.value.phone_number
    }
  }
}
