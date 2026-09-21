resource "azurerm_app_service_source_control" "app_service_source_controls" {
  for_each = var.app_service_source_controls

  app_id                 = each.value.app_id
  branch                 = each.value.branch
  repo_url               = each.value.repo_url
  rollback_enabled       = each.value.rollback_enabled
  use_local_git          = each.value.use_local_git
  use_manual_integration = each.value.use_manual_integration
  use_mercurial          = each.value.use_mercurial

  dynamic "github_action_configuration" {
    for_each = each.value.github_action_configuration != null ? each.value.github_action_configuration : []
    content {
      generate_workflow_file = github_action_configuration.value.generate_workflow_file

      dynamic "code_configuration" {
        for_each = github_action_configuration.value.code_configuration != null ? github_action_configuration.value.code_configuration : []
        content {
          runtime_stack   = code_configuration.value.runtime_stack
          runtime_version = code_configuration.value.runtime_version
        }
      }

      dynamic "container_configuration" {
        for_each = github_action_configuration.value.container_configuration != null ? github_action_configuration.value.container_configuration : []
        content {
          image_name        = container_configuration.value.image_name
          registry_url      = container_configuration.value.registry_url
          registry_password = container_configuration.value.registry_password
          registry_username = container_configuration.value.registry_username
        }
      }
    }
  }
}
