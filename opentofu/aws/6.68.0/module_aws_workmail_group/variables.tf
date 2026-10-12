variable "workmail_groups" {
  description = <<EOT
Map of workmail_groups, attributes below
Required:
    - email
    - name
    - organization_id
Optional:
    - hidden_from_global_address_list
    - region
EOT

  type = map(object({
    email                           = string
    name                            = string
    organization_id                 = string
    hidden_from_global_address_list = optional(bool)
    region                          = optional(string)
  }))
}
