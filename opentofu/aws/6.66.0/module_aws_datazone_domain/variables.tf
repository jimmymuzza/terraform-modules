variable "datazone_domains" {
  description = <<EOT
Map of datazone_domains, attributes below
Required:
    - domain_execution_role
    - name
Optional:
    - description
    - domain_version
    - kms_key_identifier
    - region
    - service_role
    - skip_deletion_check
    - tags
    - single_sign_on
EOT

  type = map(object({
    domain_execution_role = string
    name                  = string
    description           = optional(string)
    domain_version        = optional(string)
    kms_key_identifier    = optional(string)
    region                = optional(string)
    service_role          = optional(string)
    skip_deletion_check   = optional(bool)
    tags                  = optional(map(string))
    single_sign_on        = optional(list(object({
            type            = optional(string)
            user_assignment = optional(string)
        })))
  }))
}
