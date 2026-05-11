variable "glue_partition_indexes" {
  description = <<EOT
Map of glue_partition_indexes, attributes below
Required:
    - database_name
    - table_name
    - partition_index
Optional:
    - catalog_id
    - region
EOT

  type = map(object({
    database_name   = string
    table_name      = string
    catalog_id      = optional(string)
    region          = optional(string)
    partition_index = list(object({
            index_name = optional(string)
            keys       = optional(list(string))
        }))
  }))
}
