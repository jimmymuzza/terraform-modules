variable "video_indexer_accounts" {
  description = <<EOT
Map of video_indexer_accounts, attributes below
Required:
    - location
    - name
    - resource_group_name
    - identity
    - storage
Optional:
    - public_network_access
    - tags
EOT

  type = map(object({
    location              = string
    name                  = string
    resource_group_name   = string
    public_network_access = optional(string)
    tags                  = optional(map(string))
    identity              = list(object({
            type         = string
            identity_ids = optional(set(string))
        }))
    storage               = list(object({
            storage_account_id        = string
            user_assigned_identity_id = optional(string)
        }))
  }))
}
