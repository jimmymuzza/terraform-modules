variable "container_app_environment_storages" {
  description = <<EOT
Map of container_app_environment_storages, attributes below
Required:
    - access_mode
    - container_app_environment_id
    - name
    - share_name
Optional:
    - access_key
    - account_name
    - nfs_server_url
EOT

  type = map(object({
    access_mode                  = string
    container_app_environment_id = string
    name                         = string
    share_name                   = string
    access_key                   = optional(string)
    account_name                 = optional(string)
    nfs_server_url               = optional(string)
  }))
}
