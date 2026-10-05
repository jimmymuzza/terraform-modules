resource "azurerm_application_insights_workbook_template" "application_insights_workbook_templates" {
  for_each = var.application_insights_workbook_templates

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  template_data       = each.value.template_data
  author              = each.value.author
  localized           = each.value.localized
  priority            = each.value.priority
  tags                = each.value.tags

  dynamic "galleries" {
    for_each = each.value.galleries != null ? each.value.galleries : []
    content {
      category      = galleries.value.category
      name          = galleries.value.name
      order         = galleries.value.order
      resource_type = galleries.value.resource_type
      type          = galleries.value.type
    }
  }
}
