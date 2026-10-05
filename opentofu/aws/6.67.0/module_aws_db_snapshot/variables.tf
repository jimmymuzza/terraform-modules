variable "db_snapshots" {
  description = <<EOT
Map of db_snapshots, attributes below
Required:
    - db_instance_identifier
    - db_snapshot_identifier
Optional:
    - region
    - shared_accounts
    - tags
    - tags_all
EOT

  type = map(object({
    db_instance_identifier = string
    db_snapshot_identifier = string
    region                 = optional(string)
    shared_accounts        = optional(set(string))
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
  }))
}
