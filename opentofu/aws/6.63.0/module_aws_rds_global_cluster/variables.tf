variable "rds_global_clusters" {
  description = <<EOT
Map of rds_global_clusters, attributes below
Required:
    - global_cluster_identifier
Optional:
    - database_name
    - deletion_protection
    - engine
    - engine_lifecycle_support
    - engine_version
    - force_destroy
    - region
    - source_db_cluster_identifier
    - storage_encrypted
    - tags
    - tags_all
EOT

  type = map(object({
    global_cluster_identifier    = string
    database_name                = optional(string)
    deletion_protection          = optional(bool)
    engine                       = optional(string)
    engine_lifecycle_support     = optional(string)
    engine_version               = optional(string)
    force_destroy                = optional(bool)
    region                       = optional(string)
    source_db_cluster_identifier = optional(string)
    storage_encrypted            = optional(bool)
    tags                         = optional(map(string))
    tags_all                     = optional(map(string))
  }))
}
