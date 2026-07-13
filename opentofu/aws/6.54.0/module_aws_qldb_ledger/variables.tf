variable "qldb_ledgers" {
  description = <<EOT
Map of qldb_ledgers, attributes below
Required:
    - permissions_mode
Optional:
    - deletion_protection
    - kms_key
    - name
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    permissions_mode    = string
    deletion_protection = optional(bool)
    kms_key             = optional(string)
    name                = optional(string)
    region              = optional(string)
    tags                = optional(map(string))
    tags_all            = optional(map(string))
  }))
}
