variable "synapse_workspaces" {
  description = <<EOT
Map of synapse_workspaces, attributes below
Required:
    - location
    - name
    - resource_group_name
    - storage_data_lake_gen2_filesystem_id
Optional:
    - azuread_authentication_only
    - compute_subnet_id
    - data_exfiltration_protection_enabled
    - linking_allowed_for_aad_tenant_ids
    - managed_resource_group_name
    - managed_virtual_network_enabled
    - public_network_access_enabled
    - purview_id
    - sql_administrator_login
    - sql_administrator_login_password
    - sql_identity_control_enabled
    - tags
    - azure_devops_repo
    - customer_managed_key
    - github_repo
    - identity
EOT

  type = map(object({
    location                             = string
    name                                 = string
    resource_group_name                  = string
    storage_data_lake_gen2_filesystem_id = string
    azuread_authentication_only          = optional(bool)
    compute_subnet_id                    = optional(string)
    data_exfiltration_protection_enabled = optional(bool)
    linking_allowed_for_aad_tenant_ids   = optional(list(string))
    managed_resource_group_name          = optional(string)
    managed_virtual_network_enabled      = optional(bool)
    public_network_access_enabled        = optional(bool)
    purview_id                           = optional(string)
    sql_administrator_login              = optional(string)
    sql_administrator_login_password     = optional(string)
    sql_identity_control_enabled         = optional(bool)
    tags                                 = optional(map(string))
    azure_devops_repo                    = optional(list(object({
            account_name    = string
            branch_name     = string
            project_name    = string
            repository_name = string
            root_folder     = string
            last_commit_id  = optional(string)
            tenant_id       = optional(string)
        })))
    customer_managed_key                 = optional(list(object({
            key_versionless_id        = string
            key_name                  = optional(string)
            user_assigned_identity_id = optional(string)
        })))
    github_repo                          = optional(list(object({
            account_name    = string
            branch_name     = string
            repository_name = string
            root_folder     = string
            git_url         = optional(string)
            last_commit_id  = optional(string)
        })))
    identity                             = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
