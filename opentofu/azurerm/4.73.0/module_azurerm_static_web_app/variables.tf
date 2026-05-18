variable "static_web_apps" {
  description = <<EOT
Map of static_web_apps, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - app_settings
    - configuration_file_changes_enabled
    - preview_environments_enabled
    - public_network_access_enabled
    - repository_branch
    - repository_token
    - repository_url
    - sku_size
    - sku_tier
    - tags
    - basic_auth
    - identity
EOT

  type = map(object({
    location                           = string
    name                               = string
    resource_group_name                = string
    app_settings                       = optional(map(string))
    configuration_file_changes_enabled = optional(bool)
    preview_environments_enabled       = optional(bool)
    public_network_access_enabled      = optional(bool)
    repository_branch                  = optional(string)
    repository_token                   = optional(string)
    repository_url                     = optional(string)
    sku_size                           = optional(string)
    sku_tier                           = optional(string)
    tags                               = optional(map(string))
    basic_auth                         = optional(list(object({
            environments = string
            password     = string
        })))
    identity                           = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
