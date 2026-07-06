resource "azuread_invitation" "invitations" {
  for_each = var.invitations

  redirect_url       = each.value.redirect_url
  user_email_address = each.value.user_email_address
  user_display_name  = each.value.user_display_name
  user_type          = each.value.user_type

  dynamic "message" {
    for_each = each.value.message != null ? each.value.message : []
    content {
      additional_recipients = message.value.additional_recipients
      body                  = message.value.body
      language              = message.value.language
    }
  }
}
