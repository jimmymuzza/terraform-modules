resource "azurerm_cognitive_account_rai_policy" "cognitive_account_rai_policies" {
  for_each = var.cognitive_account_rai_policies

  base_policy_name     = each.value.base_policy_name
  cognitive_account_id = each.value.cognitive_account_id
  name                 = each.value.name
  mode                 = each.value.mode
  tags                 = each.value.tags

  dynamic "content_filter" {
    for_each = each.value.content_filter != null ? each.value.content_filter : []
    content {
      block_enabled      = content_filter.value.block_enabled
      filter_enabled     = content_filter.value.filter_enabled
      name               = content_filter.value.name
      severity_threshold = content_filter.value.severity_threshold
      source             = content_filter.value.source
    }
  }
}
