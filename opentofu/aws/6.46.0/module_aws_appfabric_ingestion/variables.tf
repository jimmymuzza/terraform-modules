variable "appfabric_ingestions" {
  description = <<EOT
Map of appfabric_ingestions, attributes below
Required:
    - app
    - app_bundle_arn
    - ingestion_type
    - tenant_id
Optional:
    - region
    - tags
EOT

  type = map(object({
    app            = string
    app_bundle_arn = string
    ingestion_type = string
    tenant_id      = string
    region         = optional(string)
    tags           = optional(map(string))
  }))
}
