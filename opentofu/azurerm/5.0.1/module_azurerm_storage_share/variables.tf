variable "storage_shares" {
  description = <<EOT
Map of storage_shares, attributes below
Required:
    - name
    - quota
    - storage_account_id
Optional:
    - access_tier
    - enabled_protocol
    - metadata
    - acl
EOT

  type = map(object({
    name               = string
    quota              = number
    storage_account_id = string
    access_tier        = optional(string)
    enabled_protocol   = optional(string)
    metadata           = optional(map(string))
    acl                = optional(set(object({
            access_policy = optional(list(object({
                permissions = string
                expiry      = optional(string)
                start       = optional(string)
            })))
        })))
  }))
}
