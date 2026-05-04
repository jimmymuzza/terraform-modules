variable "s3control_access_grants" {
  description = <<EOT
Map of s3control_access_grants, attributes below
Required:
    - access_grants_location_id
    - permission
Optional:
    - account_id
    - region
    - s3_prefix_type
    - tags
    - access_grants_location_configuration
    - grantee
EOT

  type = map(object({
    access_grants_location_id            = string
    permission                           = string
    account_id                           = optional(string)
    region                               = optional(string)
    s3_prefix_type                       = optional(string)
    tags                                 = optional(map(string))
    access_grants_location_configuration = optional(list(object({
            s3_sub_prefix = optional(string)
        })))
    grantee                              = optional(list(object({
            grantee_identifier = string
            grantee_type       = string
        })))
  }))
}
