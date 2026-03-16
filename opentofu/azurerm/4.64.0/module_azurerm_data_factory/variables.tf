variable "data_factories" {
  description = <<EOT
Map of data_factories, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - customer_managed_key_id
    - customer_managed_key_identity_id
    - managed_virtual_network_enabled
    - public_network_enabled
    - purview_id
    - tags
    - github_configuration
    - global_parameter
    - identity
    - vsts_configuration
EOT

  type = map(object({
    location                         = string
    name                             = string
    resource_group_name              = string
    customer_managed_key_id          = optional(string)
    customer_managed_key_identity_id = optional(string)
    managed_virtual_network_enabled  = optional(bool)
    public_network_enabled           = optional(bool)
    purview_id                       = optional(string)
    tags                             = optional(map(string))
    github_configuration             = optional(list(object({
            account_name       = string
            branch_name        = string
            repository_name    = string
            root_folder        = string
            git_url            = optional(string)
            publishing_enabled = optional(bool)
        })))
    global_parameter                 = optional(set(object({
            name  = string
            type  = string
            value = string
        })))
    identity                         = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    vsts_configuration               = optional(list(object({
            account_name       = string
            branch_name        = string
            project_name       = string
            repository_name    = string
            root_folder        = string
            tenant_id          = string
            publishing_enabled = optional(bool)
        })))
  }))
}
