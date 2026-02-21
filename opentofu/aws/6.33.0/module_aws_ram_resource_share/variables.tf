variable "ram_resource_shares" {
  description = <<EOT
Map of ram_resource_shares, attributes below
Required:
    - name
Optional:
    - allow_external_principals
    - permission_arns
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name                      = string
    allow_external_principals = optional(bool)
    permission_arns           = optional(set(string))
    region                    = optional(string)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
  }))
}
