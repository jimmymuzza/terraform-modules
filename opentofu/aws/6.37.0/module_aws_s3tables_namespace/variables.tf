variable "s3tables_namespaces" {
  description = <<EOT
Map of s3tables_namespaces, attributes below
Required:
    - namespace
    - table_bucket_arn
Optional:
    - region
EOT

  type = map(object({
    namespace        = string
    table_bucket_arn = string
    region           = optional(string)
  }))
}
