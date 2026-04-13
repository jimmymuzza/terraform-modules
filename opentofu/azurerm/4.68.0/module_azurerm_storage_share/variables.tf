variable "storage_shares" {
  description = <<EOT
Map of storage_shares, attributes below
Required:
    - name
    - quota
Optional:
    - access_tier
    - enabled_protocol
    - metadata
    - storage_account_id
    - storage_account_name
    - acl
EOT

  type = map(object({
    name                 = string
    quota                = number
    access_tier          = optional(string)
    enabled_protocol     = optional(string)
    metadata             = optional(map(string))
    storage_account_id   = optional(string)
    storage_account_name = optional(string)
    acl                  = optional(set(object({
            access_policy = optional(list(object({
                permissions = string
                expiry      = optional(string)
                start       = optional(string)
            })))
        })))
  }))
}
