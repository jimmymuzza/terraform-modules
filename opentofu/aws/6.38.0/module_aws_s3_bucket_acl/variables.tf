variable "s3_bucket_acls" {
  description = <<EOT
Map of s3_bucket_acls, attributes below
Required:
    - bucket
Optional:
    - acl
    - expected_bucket_owner
    - region
    - access_control_policy
EOT

  type = map(object({
    bucket                = string
    acl                   = optional(string)
    expected_bucket_owner = optional(string)
    region                = optional(string)
    access_control_policy = optional(list(object({
            grant = optional(set(object({
                permission = string
                grantee    = optional(list(object({
                    type          = string
                    email_address = optional(string)
                    uri           = optional(string)
                })))
            })))
            owner = list(object({
                display_name = optional(string)
            }))
        })))
  }))
}
