variable "cloudhsm_v2_clusters" {
  description = <<EOT
Map of cloudhsm_v2_clusters, attributes below
Required:
    - hsm_type
    - subnet_ids
Optional:
    - mode
    - region
    - source_backup_identifier
    - tags
    - tags_all
EOT

  type = map(object({
    hsm_type                 = string
    subnet_ids               = set(string)
    mode                     = optional(string)
    region                   = optional(string)
    source_backup_identifier = optional(string)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
  }))
}
