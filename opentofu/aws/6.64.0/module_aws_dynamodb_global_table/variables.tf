variable "dynamodb_global_tables" {
  description = <<EOT
Map of dynamodb_global_tables, attributes below
Required:
    - name
    - replica
Optional:
    - region
EOT

  type = map(object({
    name    = string
    region  = optional(string)
    replica = set(object({
            region_name = string
        }))
  }))
}
