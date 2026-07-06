variable "netapp_volume_buckets" {
  description = <<EOT
Map of netapp_volume_buckets, attributes below
Required:
    - name
    - volume_id
Optional:
    - file_system_cifs_username
    - path
    - permissions
    - file_system_nfs_user
    - key_vault
EOT

  type = map(object({
    name                      = string
    volume_id                 = string
    file_system_cifs_username = optional(string)
    path                      = optional(string)
    permissions               = optional(string)
    file_system_nfs_user      = optional(list(object({
            group_id = number
            user_id  = number
        })))
    key_vault                 = optional(list(object({
            certificate_key_vault_uri = string
            certificate_name          = string
            credentials_key_vault_uri = string
            credentials_secret_name   = string
        })))
  }))
}
