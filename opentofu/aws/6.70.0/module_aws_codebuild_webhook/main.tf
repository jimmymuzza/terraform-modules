resource "aws_codebuild_webhook" "codebuild_webhooks" {
  for_each = var.codebuild_webhooks

  project_name    = each.value.project_name
  branch_filter   = each.value.branch_filter
  build_type      = each.value.build_type
  manual_creation = each.value.manual_creation
  region          = each.value.region

  dynamic "filter_group" {
    for_each = each.value.filter_group != null ? each.value.filter_group : []
    content {

      dynamic "filter" {
        for_each = filter_group.value.filter != null ? filter_group.value.filter : []
        content {
          pattern                 = filter.value.pattern
          type                    = filter.value.type
          exclude_matched_pattern = filter.value.exclude_matched_pattern
        }
      }
    }
  }

  dynamic "pull_request_build_policy" {
    for_each = each.value.pull_request_build_policy != null ? each.value.pull_request_build_policy : []
    content {
      requires_comment_approval = pull_request_build_policy.value.requires_comment_approval
      approver_roles            = pull_request_build_policy.value.approver_roles
    }
  }

  dynamic "scope_configuration" {
    for_each = each.value.scope_configuration != null ? each.value.scope_configuration : []
    content {
      name   = scope_configuration.value.name
      scope  = scope_configuration.value.scope
      domain = scope_configuration.value.domain
    }
  }
}
