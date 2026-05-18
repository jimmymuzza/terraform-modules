variable "default_vpc_dhcp_options" {
  description = <<EOT
Map of default_vpc_dhcp_options, attributes below
Optional:
    - owner_id
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    owner_id = optional(string)
    region   = optional(string)
    tags     = optional(map(string))
    tags_all = optional(map(string))
  }))
}
