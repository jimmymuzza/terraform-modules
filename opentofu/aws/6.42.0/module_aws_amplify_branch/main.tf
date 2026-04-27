resource "aws_amplify_branch" "amplify_branches" {
  for_each = var.amplify_branches

  app_id                        = each.value.app_id
  branch_name                   = each.value.branch_name
  backend_environment_arn       = each.value.backend_environment_arn
  basic_auth_credentials        = each.value.basic_auth_credentials
  description                   = each.value.description
  display_name                  = each.value.display_name
  enable_auto_build             = each.value.enable_auto_build
  enable_basic_auth             = each.value.enable_basic_auth
  enable_notification           = each.value.enable_notification
  enable_performance_mode       = each.value.enable_performance_mode
  enable_pull_request_preview   = each.value.enable_pull_request_preview
  enable_skew_protection        = each.value.enable_skew_protection
  environment_variables         = each.value.environment_variables
  framework                     = each.value.framework
  pull_request_environment_name = each.value.pull_request_environment_name
  region                        = each.value.region
  stage                         = each.value.stage
  tags                          = each.value.tags
  tags_all                      = each.value.tags_all
  ttl                           = each.value.ttl
}
