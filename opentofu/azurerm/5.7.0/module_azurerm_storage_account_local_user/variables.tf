variable "storage_account_local_users" {
  description = <<EOT
Map of storage_account_local_users, attributes below
Required:
    - name
    - storage_account_id
Optional:
    - home_directory
    - ssh_key_enabled
    - ssh_password_enabled
    - permission_scope
    - ssh_authorized_key
EOT

  type = map(object({
    name                 = string
    storage_account_id   = string
    home_directory       = optional(string)
    ssh_key_enabled      = optional(bool)
    ssh_password_enabled = optional(bool)
    permission_scope     = optional(list(object({
            resource_name = string
            service       = string
            permissions   = list(object({
                create = optional(bool)
                delete = optional(bool)
                list   = optional(bool)
                read   = optional(bool)
                write  = optional(bool)
            }))
        })))
    ssh_authorized_key   = optional(list(object({
            key         = string
            description = optional(string)
        })))
  }))
}
