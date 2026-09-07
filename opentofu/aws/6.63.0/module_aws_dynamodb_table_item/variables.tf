variable "dynamodb_table_items" {
  description = <<EOT
Map of dynamodb_table_items, attributes below
Required:
    - hash_key
    - item
    - table_name
Optional:
    - range_key
    - region
EOT

  type = map(object({
    hash_key   = string
    item       = string
    table_name = string
    range_key  = optional(string)
    region     = optional(string)
  }))
}
