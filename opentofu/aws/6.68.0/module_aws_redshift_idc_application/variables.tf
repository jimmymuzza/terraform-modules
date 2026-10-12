variable "redshift_idc_applications" {
  description = <<EOT
Map of redshift_idc_applications, attributes below
Required:
    - iam_role_arn
    - idc_display_name
    - idc_instance_arn
    - redshift_idc_application_name
Optional:
    - application_type
    - identity_namespace
    - region
    - tags
    - authorized_token_issuer
    - service_integration
EOT

  type = map(object({
    iam_role_arn                  = string
    idc_display_name              = string
    idc_instance_arn              = string
    redshift_idc_application_name = string
    application_type              = optional(string)
    identity_namespace            = optional(string)
    region                        = optional(string)
    tags                          = optional(map(string))
    authorized_token_issuer       = optional(list(object({
            authorized_audiences_list = optional(list(string))
            trusted_token_issuer_arn  = optional(string)
        })))
    service_integration           = optional(list(object({
            lake_formation   = optional(list(object({
                lake_formation_query = optional(list(object({
                    authorization = string
                })))
            })))
            redshift         = optional(list(object({
                connect = optional(list(object({
                    authorization = string
                })))
            })))
            s3_access_grants = optional(list(object({
                read_write_access = optional(list(object({
                    authorization = string
                })))
            })))
        })))
  }))
}
