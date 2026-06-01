variable "virtual_wans" {
  description = <<EOT
Map of virtual_wans, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - allow_branch_to_branch_traffic
    - disable_vpn_encryption
    - office365_local_breakout_category
    - tags
    - type
EOT

  type = map(object({
    location                          = string
    name                              = string
    resource_group_name               = string
    allow_branch_to_branch_traffic    = optional(bool)
    disable_vpn_encryption            = optional(bool)
    office365_local_breakout_category = optional(string)
    tags                              = optional(map(string))
    type                              = optional(string)
  }))
}
