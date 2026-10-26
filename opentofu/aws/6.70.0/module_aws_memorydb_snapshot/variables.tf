variable "memorydb_snapshots" {
  description = <<EOT
Map of memorydb_snapshots, attributes below
Required:
    - cluster_name
Optional:
    - kms_key_arn
    - name
    - name_prefix
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    cluster_name = string
    kms_key_arn  = optional(string)
    name         = optional(string)
    name_prefix  = optional(string)
    region       = optional(string)
    tags         = optional(map(string))
    tags_all     = optional(map(string))
  }))
}
