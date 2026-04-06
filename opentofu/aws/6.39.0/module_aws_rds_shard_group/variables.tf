variable "rds_shard_groups" {
  description = <<EOT
Map of rds_shard_groups, attributes below
Required:
    - db_cluster_identifier
    - db_shard_group_identifier
    - max_acu
Optional:
    - compute_redundancy
    - min_acu
    - publicly_accessible
    - region
    - tags
EOT

  type = map(object({
    db_cluster_identifier     = string
    db_shard_group_identifier = string
    max_acu                   = number
    compute_redundancy        = optional(number)
    min_acu                   = optional(number)
    publicly_accessible       = optional(bool)
    region                    = optional(string)
    tags                      = optional(map(string))
  }))
}
