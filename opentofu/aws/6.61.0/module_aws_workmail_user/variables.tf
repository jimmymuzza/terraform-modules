variable "workmail_users" {
  description = <<EOT
Map of workmail_users, attributes below
Required:
    - display_name
    - email
    - name
    - organization_id
Optional:
    - city
    - company
    - country
    - department
    - first_name
    - hidden_from_global_address_list
    - identity_provider_user_id
    - initials
    - job_title
    - last_name
    - office
    - password
    - region
    - street
    - telephone
    - user_role
    - zip_code
EOT

  type = map(object({
    display_name                    = string
    email                           = string
    name                            = string
    organization_id                 = string
    city                            = optional(string)
    company                         = optional(string)
    country                         = optional(string)
    department                      = optional(string)
    first_name                      = optional(string)
    hidden_from_global_address_list = optional(bool)
    identity_provider_user_id       = optional(string)
    initials                        = optional(string)
    job_title                       = optional(string)
    last_name                       = optional(string)
    office                          = optional(string)
    password                        = optional(string)
    region                          = optional(string)
    street                          = optional(string)
    telephone                       = optional(string)
    user_role                       = optional(string)
    zip_code                        = optional(string)
  }))
}
