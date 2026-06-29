resource "aws_backup_selection" "backup_selections" {
  for_each = var.backup_selections

  iam_role_arn  = each.value.iam_role_arn
  name          = each.value.name
  plan_id       = each.value.plan_id
  not_resources = each.value.not_resources
  region        = each.value.region
  resources     = each.value.resources

  dynamic "condition" {
    for_each = each.value.condition != null ? each.value.condition : []
    content {

      dynamic "string_equals" {
        for_each = condition.value.string_equals != null ? condition.value.string_equals : []
        content {
          key   = string_equals.value.key
          value = string_equals.value.value
        }
      }

      dynamic "string_like" {
        for_each = condition.value.string_like != null ? condition.value.string_like : []
        content {
          key   = string_like.value.key
          value = string_like.value.value
        }
      }

      dynamic "string_not_equals" {
        for_each = condition.value.string_not_equals != null ? condition.value.string_not_equals : []
        content {
          key   = string_not_equals.value.key
          value = string_not_equals.value.value
        }
      }

      dynamic "string_not_like" {
        for_each = condition.value.string_not_like != null ? condition.value.string_not_like : []
        content {
          key   = string_not_like.value.key
          value = string_not_like.value.value
        }
      }
    }
  }

  dynamic "selection_tag" {
    for_each = each.value.selection_tag != null ? each.value.selection_tag : []
    content {
      key   = selection_tag.value.key
      type  = selection_tag.value.type
      value = selection_tag.value.value
    }
  }
}
