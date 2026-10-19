variable "application_optional_claims" {
  description = <<EOT
Map of application_optional_claims, attributes below
Required:
    - application_id
Optional:
    - access_token
    - id_token
    - saml2_token
EOT

  type = map(object({
    application_id = string
    access_token   = optional(list(object({
            name                  = string
            additional_properties = optional(list(string))
            essential             = optional(bool)
            source                = optional(string)
        })))
    id_token       = optional(list(object({
            name                  = string
            additional_properties = optional(list(string))
            essential             = optional(bool)
            source                = optional(string)
        })))
    saml2_token    = optional(list(object({
            name                  = string
            additional_properties = optional(list(string))
            essential             = optional(bool)
            source                = optional(string)
        })))
  }))
}
