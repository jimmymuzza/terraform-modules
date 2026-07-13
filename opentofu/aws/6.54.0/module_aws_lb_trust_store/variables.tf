variable "lb_trust_stores" {
  description = <<EOT
Map of lb_trust_stores, attributes below
Required:
    - ca_certificates_bundle_s3_bucket
    - ca_certificates_bundle_s3_key
Optional:
    - ca_certificates_bundle_s3_object_version
    - name
    - name_prefix
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    ca_certificates_bundle_s3_bucket         = string
    ca_certificates_bundle_s3_key            = string
    ca_certificates_bundle_s3_object_version = optional(string)
    name                                     = optional(string)
    name_prefix                              = optional(string)
    region                                   = optional(string)
    tags                                     = optional(map(string))
    tags_all                                 = optional(map(string))
  }))
}
