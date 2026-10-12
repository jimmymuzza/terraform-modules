resource "aws_transfer_web_app_customization" "transfer_web_app_customizations" {
  for_each = var.transfer_web_app_customizations

  web_app_id   = each.value.web_app_id
  favicon_file = each.value.favicon_file
  logo_file    = each.value.logo_file
  region       = each.value.region
  title        = each.value.title
}
