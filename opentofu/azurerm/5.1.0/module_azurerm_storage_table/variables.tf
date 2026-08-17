variable "storage_tables" {
  description = <<EOT
Map of storage_tables, attributes below
Required:
    - name
    - storage_account_id
Optional:
    - acl
EOT

  type = map(object({
    name               = string
    storage_account_id = string
    acl                = optional(set(object({
            access_policy = optional(list(object({
                expiry      = string
                permissions = string
                start       = string
            })))
        })))
  }))
}
