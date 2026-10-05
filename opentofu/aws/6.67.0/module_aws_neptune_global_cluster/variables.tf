variable "neptune_global_clusters" {
  description = <<EOT
Map of neptune_global_clusters, attributes below
Required:
    - global_cluster_identifier
Optional:
    - deletion_protection
    - engine
    - engine_version
    - region
    - source_db_cluster_identifier
    - storage_encrypted
EOT

  type = map(object({
    global_cluster_identifier    = string
    deletion_protection          = optional(bool)
    engine                       = optional(string)
    engine_version               = optional(string)
    region                       = optional(string)
    source_db_cluster_identifier = optional(string)
    storage_encrypted            = optional(bool)
  }))
}
