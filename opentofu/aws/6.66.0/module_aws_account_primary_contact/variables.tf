variable "account_primary_contacts" {
  description = <<EOT
Map of account_primary_contacts, attributes below
Required:
    - address_line_1
    - city
    - country_code
    - full_name
    - phone_number
    - postal_code
Optional:
    - account_id
    - address_line_2
    - address_line_3
    - company_name
    - district_or_county
    - state_or_region
    - website_url
EOT

  type = map(object({
    address_line_1     = string
    city               = string
    country_code       = string
    full_name          = string
    phone_number       = string
    postal_code        = string
    account_id         = optional(string)
    address_line_2     = optional(string)
    address_line_3     = optional(string)
    company_name       = optional(string)
    district_or_county = optional(string)
    state_or_region    = optional(string)
    website_url        = optional(string)
  }))
}
