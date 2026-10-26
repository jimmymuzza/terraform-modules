variable "opensearchserverless_security_configs" {
  description = <<EOT
Map of opensearchserverless_security_configs, attributes below
Required:
    - name
    - type
Optional:
    - description
    - region
    - iam_federation_options
    - iam_identity_center_options
    - saml_options
EOT

  type = map(object({
    name                        = string
    type                        = string
    description                 = optional(string)
    region                      = optional(string)
    iam_federation_options      = optional(list(object({
            group_attribute = optional(string)
            user_attribute  = optional(string)
        })))
    iam_identity_center_options = optional(list(object({
            instance_arn    = string
            group_attribute = optional(string)
            user_attribute  = optional(string)
        })))
    saml_options                = optional(list(object({
            metadata        = string
            group_attribute = optional(string)
            session_timeout = optional(number)
            user_attribute  = optional(string)
        })))
  }))
}
