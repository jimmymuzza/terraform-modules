variable "ssmincidents_replication_sets" {
  description = <<EOT
Map of ssmincidents_replication_sets, attributes below
Optional:
    - tags
    - tags_all
    - region
    - regions
EOT

  type = map(object({
    tags     = optional(map(string))
    tags_all = optional(map(string))
    region   = optional(set(object({
            name        = string
            kms_key_arn = optional(string)
        })))
    regions  = optional(set(object({
            name        = string
            kms_key_arn = optional(string)
        })))
  }))
}
