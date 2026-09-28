variable "eventgrid_partner_registrations" {
  description = <<EOT
Map of eventgrid_partner_registrations, attributes below
Required:
    - name
    - resource_group_name
Optional:
    - tags
EOT

  type = map(object({
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
  }))
}
