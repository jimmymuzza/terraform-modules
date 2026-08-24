variable "athena_databases" {
  description = <<EOT
Map of athena_databases, attributes below
Required:
    - name
Optional:
    - bucket
    - comment
    - expected_bucket_owner
    - force_destroy
    - properties
    - region
    - workgroup
    - acl_configuration
    - encryption_configuration
EOT

  type = map(object({
    name                     = string
    bucket                   = optional(string)
    comment                  = optional(string)
    expected_bucket_owner    = optional(string)
    force_destroy            = optional(bool)
    properties               = optional(map(string))
    region                   = optional(string)
    workgroup                = optional(string)
    acl_configuration        = optional(list(object({
            s3_acl_option = string
        })))
    encryption_configuration = optional(list(object({
            encryption_option = string
            kms_key           = optional(string)
        })))
  }))
}
