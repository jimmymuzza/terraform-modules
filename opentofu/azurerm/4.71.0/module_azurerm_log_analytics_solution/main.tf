resource "azurerm_log_analytics_solution" "log_analytics_solutions" {
  for_each = var.log_analytics_solutions

  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  solution_name         = each.value.solution_name
  workspace_name        = each.value.workspace_name
  workspace_resource_id = each.value.workspace_resource_id
  tags                  = each.value.tags

  dynamic "plan" {
    for_each = each.value.plan != null ? each.value.plan : []
    content {
      product        = plan.value.product
      publisher      = plan.value.publisher
      promotion_code = plan.value.promotion_code
    }
  }
}
