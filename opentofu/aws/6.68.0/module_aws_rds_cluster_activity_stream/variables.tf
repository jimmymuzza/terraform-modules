variable "rds_cluster_activity_streams" {
  description = <<EOT
Map of rds_cluster_activity_streams, attributes below
Required:
    - kms_key_id
    - mode
    - resource_arn
Optional:
    - engine_native_audit_fields_included
    - region
EOT

  type = map(object({
    kms_key_id                          = string
    mode                                = string
    resource_arn                        = string
    engine_native_audit_fields_included = optional(bool)
    region                              = optional(string)
  }))
}
