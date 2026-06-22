variable "storage_tables" {
  description = <<EOT
Map of storage_tables, attributes below
Required:
    - name
Optional:
    - storage_account_id
    - storage_account_name
    - acl
EOT

  type = map(object({
    name                 = string
    storage_account_id   = optional(string)
    storage_account_name = optional(string)
    acl                  = optional(set(object({
            access_policy = optional(list(object({
                expiry      = string
                permissions = string
                start       = string
            })))
        })))
  }))
}
