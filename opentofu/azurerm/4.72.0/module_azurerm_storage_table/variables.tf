variable "storage_tables" {
  description = <<EOT
Map of storage_tables, attributes below
Required:
    - name
    - storage_account_name
Optional:
    - acl
EOT

  type = map(object({
    name                 = string
    storage_account_name = string
    acl                  = optional(set(object({
            access_policy = optional(list(object({
                expiry      = string
                permissions = string
                start       = string
            })))
        })))
  }))
}
