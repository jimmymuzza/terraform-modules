resource "azurerm_synapse_workspace" "synapse_workspaces" {
  for_each = var.synapse_workspaces

  location                             = each.value.location
  name                                 = each.value.name
  resource_group_name                  = each.value.resource_group_name
  storage_data_lake_gen2_filesystem_id = each.value.storage_data_lake_gen2_filesystem_id
  azuread_authentication_only          = each.value.azuread_authentication_only
  compute_subnet_id                    = each.value.compute_subnet_id
  data_exfiltration_protection_enabled = each.value.data_exfiltration_protection_enabled
  linking_allowed_for_aad_tenant_ids   = each.value.linking_allowed_for_aad_tenant_ids
  managed_resource_group_name          = each.value.managed_resource_group_name
  managed_virtual_network_enabled      = each.value.managed_virtual_network_enabled
  public_network_access_enabled        = each.value.public_network_access_enabled
  purview_id                           = each.value.purview_id
  sql_administrator_login              = each.value.sql_administrator_login
  sql_administrator_login_password     = each.value.sql_administrator_login_password
  sql_identity_control_enabled         = each.value.sql_identity_control_enabled
  tags                                 = each.value.tags

  dynamic "azure_devops_repo" {
    for_each = each.value.azure_devops_repo != null ? each.value.azure_devops_repo : []
    content {
      account_name    = azure_devops_repo.value.account_name
      branch_name     = azure_devops_repo.value.branch_name
      project_name    = azure_devops_repo.value.project_name
      repository_name = azure_devops_repo.value.repository_name
      root_folder     = azure_devops_repo.value.root_folder
      last_commit_id  = azure_devops_repo.value.last_commit_id
      tenant_id       = azure_devops_repo.value.tenant_id
    }
  }

  dynamic "customer_managed_key" {
    for_each = each.value.customer_managed_key != null ? each.value.customer_managed_key : []
    content {
      key_versionless_id        = customer_managed_key.value.key_versionless_id
      key_name                  = customer_managed_key.value.key_name
      user_assigned_identity_id = customer_managed_key.value.user_assigned_identity_id
    }
  }

  dynamic "github_repo" {
    for_each = each.value.github_repo != null ? each.value.github_repo : []
    content {
      account_name    = github_repo.value.account_name
      branch_name     = github_repo.value.branch_name
      repository_name = github_repo.value.repository_name
      root_folder     = github_repo.value.root_folder
      git_url         = github_repo.value.git_url
      last_commit_id  = github_repo.value.last_commit_id
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
