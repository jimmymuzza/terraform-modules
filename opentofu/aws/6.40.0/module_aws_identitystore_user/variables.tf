variable "identitystore_users" {
  description = <<EOT
Map of identitystore_users, attributes below
Required:
    - display_name
    - identity_store_id
    - user_name
    - name
Optional:
    - locale
    - nickname
    - preferred_language
    - profile_url
    - region
    - timezone
    - title
    - user_type
    - addresses
    - emails
    - phone_numbers
EOT

  type = map(object({
    display_name       = string
    identity_store_id  = string
    user_name          = string
    locale             = optional(string)
    nickname           = optional(string)
    preferred_language = optional(string)
    profile_url        = optional(string)
    region             = optional(string)
    timezone           = optional(string)
    title              = optional(string)
    user_type          = optional(string)
    addresses          = optional(list(object({
            country        = optional(string)
            formatted      = optional(string)
            locality       = optional(string)
            postal_code    = optional(string)
            primary        = optional(bool)
            region         = optional(string)
            street_address = optional(string)
            type           = optional(string)
        })))
    emails             = optional(list(object({
            primary = optional(bool)
            type    = optional(string)
            value   = optional(string)
        })))
    name               = list(object({
            family_name      = string
            given_name       = string
            formatted        = optional(string)
            honorific_prefix = optional(string)
            honorific_suffix = optional(string)
            middle_name      = optional(string)
        }))
    phone_numbers      = optional(list(object({
            primary = optional(bool)
            type    = optional(string)
            value   = optional(string)
        })))
  }))
}
