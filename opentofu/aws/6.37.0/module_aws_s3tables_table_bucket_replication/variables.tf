variable "s3tables_table_bucket_replications" {
  description = <<EOT
Map of s3tables_table_bucket_replications, attributes below
Required:
    - role
    - table_bucket_arn
Optional:
    - region
    - rule
EOT

  type = map(object({
    role             = string
    table_bucket_arn = string
    region           = optional(string)
    rule             = optional(list(object({
            destination = optional(set(object({
                destination_table_bucket_arn = string
            })))
        })))
  }))
}
