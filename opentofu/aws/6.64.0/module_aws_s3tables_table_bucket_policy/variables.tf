variable "s3tables_table_bucket_policies" {
  description = <<EOT
Map of s3tables_table_bucket_policies, attributes below
Required:
    - resource_policy
    - table_bucket_arn
Optional:
    - region
EOT

  type = map(object({
    resource_policy  = string
    table_bucket_arn = string
    region           = optional(string)
  }))
}
