variable "directoryservicedata_groups" {
  description = <<EOT
Map of directoryservicedata_groups, attributes below
Required:
    - directory_id
    - sam_account_name
Optional:
    - group_scope
    - group_type
    - region
EOT

  type = map(object({
    directory_id     = string
    sam_account_name = string
    group_scope      = optional(string)
    group_type       = optional(string)
    region           = optional(string)
  }))
}
