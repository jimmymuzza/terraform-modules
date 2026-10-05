variable "netapp_backup_vaults" {
  description = <<EOT
Map of netapp_backup_vaults, attributes below
Required:
    - account_name
    - location
    - name
    - resource_group_name
Optional:
    - tags
EOT

  type = map(object({
    account_name        = string
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
  }))
}
