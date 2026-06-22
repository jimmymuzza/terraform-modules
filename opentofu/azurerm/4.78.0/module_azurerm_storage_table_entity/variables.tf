variable "storage_table_entities" {
  description = <<EOT
Map of storage_table_entities, attributes below
Required:
    - entity
    - partition_key
    - row_key
    - storage_table_id
EOT

  type = map(object({
    entity           = map(string)
    partition_key    = string
    row_key          = string
    storage_table_id = string
  }))
}
