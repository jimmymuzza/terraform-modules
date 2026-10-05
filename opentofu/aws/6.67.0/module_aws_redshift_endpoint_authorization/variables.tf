variable "redshift_endpoint_authorizations" {
  description = <<EOT
Map of redshift_endpoint_authorizations, attributes below
Required:
    - account
    - cluster_identifier
Optional:
    - force_delete
    - region
    - vpc_ids
EOT

  type = map(object({
    account            = string
    cluster_identifier = string
    force_delete       = optional(bool)
    region             = optional(string)
    vpc_ids            = optional(set(string))
  }))
}
