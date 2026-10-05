variable "redshift_namespace_registrations" {
  description = <<EOT
Map of redshift_namespace_registrations, attributes below
Required:
    - consumer_identifier
    - namespace_type
Optional:
    - provisioned_cluster_identifier
    - region
    - serverless_namespace_identifier
    - serverless_workgroup_identifier
EOT

  type = map(object({
    consumer_identifier             = string
    namespace_type                  = string
    provisioned_cluster_identifier  = optional(string)
    region                          = optional(string)
    serverless_namespace_identifier = optional(string)
    serverless_workgroup_identifier = optional(string)
  }))
}
