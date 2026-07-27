resource "azurerm_chaos_studio_experiment" "chaos_studio_experiments" {
  for_each = var.chaos_studio_experiments

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "selectors" {
    for_each = each.value.selectors != null ? each.value.selectors : []
    content {
      chaos_studio_target_ids = selectors.value.chaos_studio_target_ids
      name                    = selectors.value.name
    }
  }

  dynamic "steps" {
    for_each = each.value.steps != null ? each.value.steps : []
    content {
      name = steps.value.name

      dynamic "branch" {
        for_each = steps.value.branch != null ? steps.value.branch : []
        content {
          name = branch.value.name

          dynamic "actions" {
            for_each = branch.value.actions != null ? branch.value.actions : []
            content {
              action_type   = actions.value.action_type
              duration      = actions.value.duration
              parameters    = actions.value.parameters
              selector_name = actions.value.selector_name
              urn           = actions.value.urn
            }
          }
        }
      }
    }
  }
}
