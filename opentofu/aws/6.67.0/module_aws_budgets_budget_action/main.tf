resource "aws_budgets_budget_action" "budgets_budget_actions" {
  for_each = var.budgets_budget_actions

  action_type        = each.value.action_type
  approval_model     = each.value.approval_model
  budget_name        = each.value.budget_name
  execution_role_arn = each.value.execution_role_arn
  notification_type  = each.value.notification_type
  account_id         = each.value.account_id
  tags               = each.value.tags
  tags_all           = each.value.tags_all

  dynamic "action_threshold" {
    for_each = each.value.action_threshold != null ? each.value.action_threshold : []
    content {
      action_threshold_type  = action_threshold.value.action_threshold_type
      action_threshold_value = action_threshold.value.action_threshold_value
    }
  }

  dynamic "definition" {
    for_each = each.value.definition != null ? each.value.definition : []
    content {

      dynamic "iam_action_definition" {
        for_each = definition.value.iam_action_definition != null ? definition.value.iam_action_definition : []
        content {
          policy_arn = iam_action_definition.value.policy_arn
          groups     = iam_action_definition.value.groups
          roles      = iam_action_definition.value.roles
          users      = iam_action_definition.value.users
        }
      }

      dynamic "scp_action_definition" {
        for_each = definition.value.scp_action_definition != null ? definition.value.scp_action_definition : []
        content {
          policy_id  = scp_action_definition.value.policy_id
          target_ids = scp_action_definition.value.target_ids
        }
      }

      dynamic "ssm_action_definition" {
        for_each = definition.value.ssm_action_definition != null ? definition.value.ssm_action_definition : []
        content {
          action_sub_type = ssm_action_definition.value.action_sub_type
          instance_ids    = ssm_action_definition.value.instance_ids
          region          = ssm_action_definition.value.region
        }
      }
    }
  }

  dynamic "subscriber" {
    for_each = each.value.subscriber != null ? each.value.subscriber : []
    content {
      address           = subscriber.value.address
      subscription_type = subscriber.value.subscription_type
    }
  }
}
