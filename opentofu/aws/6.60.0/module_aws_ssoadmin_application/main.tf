resource "aws_ssoadmin_application" "ssoadmin_applications" {
  for_each = var.ssoadmin_applications

  application_provider_arn = each.value.application_provider_arn
  instance_arn             = each.value.instance_arn
  name                     = each.value.name
  client_token             = each.value.client_token
  description              = each.value.description
  region                   = each.value.region
  status                   = each.value.status
  tags                     = each.value.tags

  dynamic "portal_options" {
    for_each = each.value.portal_options != null ? each.value.portal_options : []
    content {
      visibility = portal_options.value.visibility

      dynamic "sign_in_options" {
        for_each = portal_options.value.sign_in_options != null ? portal_options.value.sign_in_options : []
        content {
          origin          = sign_in_options.value.origin
          application_url = sign_in_options.value.application_url
        }
      }
    }
  }
}
