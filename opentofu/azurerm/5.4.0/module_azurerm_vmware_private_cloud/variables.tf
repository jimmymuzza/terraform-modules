variable "vmware_private_clouds" {
  description = <<EOT
Map of vmware_private_clouds, attributes below
Required:
    - location
    - name
    - network_subnet_cidr
    - resource_group_name
    - sku_name
    - management_cluster
Optional:
    - internet_connection_enabled
    - nsxt_password
    - tags
    - vcenter_password
EOT

  type = map(object({
    location                    = string
    name                        = string
    network_subnet_cidr         = string
    resource_group_name         = string
    sku_name                    = string
    internet_connection_enabled = optional(bool)
    nsxt_password               = optional(string)
    tags                        = optional(map(string))
    vcenter_password            = optional(string)
    management_cluster          = list(object({
            size = number
        }))
  }))
}
