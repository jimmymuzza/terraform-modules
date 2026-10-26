variable "s3tables_table_policies" {
  description = <<EOT
Map of s3tables_table_policies, attributes below
Required:
    - name
    - namespace
    - resource_policy
    - table_bucket_arn
Optional:
    - region
EOT

  type = map(object({
    name             = string
    namespace        = string
    resource_policy  = string
    table_bucket_arn = string
    region           = optional(string)
  }))
}
