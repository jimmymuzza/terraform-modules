variable "vpc_dhcp_options_associations" {
  description = <<EOT
Map of vpc_dhcp_options_associations, attributes below
Required:
    - dhcp_options_id
    - vpc_id
Optional:
    - region
EOT

  type = map(object({
    dhcp_options_id = string
    vpc_id          = string
    region          = optional(string)
  }))
}
