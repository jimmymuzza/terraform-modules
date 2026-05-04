variable "netapp_snapshots" {
  description = <<EOT
Map of netapp_snapshots, attributes below
Required:
    - account_name
    - location
    - name
    - pool_name
    - resource_group_name
    - volume_name
EOT

  type = map(object({
    account_name        = string
    location            = string
    name                = string
    pool_name           = string
    resource_group_name = string
    volume_name         = string
  }))
}
