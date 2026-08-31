resource "azurerm_automation_dsc_nodeconfiguration" "automation_dsc_nodeconfigurations" {
  for_each = var.automation_dsc_nodeconfigurations

  automation_account_name = each.value.automation_account_name
  content_embedded        = each.value.content_embedded
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
}
