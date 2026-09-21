resource "azurerm_virtual_desktop_application" "virtual_desktop_applications" {
  for_each = var.virtual_desktop_applications

  application_group_id         = each.value.application_group_id
  command_line_argument_policy = each.value.command_line_argument_policy
  name                         = each.value.name
  path                         = each.value.path
  command_line_arguments       = each.value.command_line_arguments
  description                  = each.value.description
  friendly_name                = each.value.friendly_name
  icon_index                   = each.value.icon_index
  icon_path                    = each.value.icon_path
  show_in_portal               = each.value.show_in_portal
}
