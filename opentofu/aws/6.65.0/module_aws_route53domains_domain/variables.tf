variable "route53domains_domains" {
  description = <<EOT
Map of route53domains_domains, attributes below
Required:
    - domain_name
Optional:
    - admin_privacy
    - auto_renew
    - billing_contact
    - billing_privacy
    - duration_in_years
    - name_server
    - registrant_privacy
    - tags
    - tech_privacy
    - transfer_lock
    - admin_contact
    - registrant_contact
    - tech_contact
EOT

  type = map(object({
    domain_name        = string
    admin_privacy      = optional(bool)
    auto_renew         = optional(bool)
    billing_contact    = optional(list(object({
            address_line_1 = string
            address_line_2 = string
            city = string
            contact_type = string
            country_code = string
            email = string
            extra_param = list(object({
                name = string
                value = string
            }))
            fax = string
            first_name = string
            last_name = string
            organization_name = string
            phone_number = string
            state = string
            zip_code = string
        })))
    billing_privacy    = optional(bool)
    duration_in_years  = optional(number)
    name_server        = optional(list(object({
            glue_ips = set(string)
            name = string
        })))
    registrant_privacy = optional(bool)
    tags               = optional(map(string))
    tech_privacy       = optional(bool)
    transfer_lock      = optional(bool)
    admin_contact      = optional(list(object({
            address_line_1    = optional(string)
            address_line_2    = optional(string)
            city              = optional(string)
            contact_type      = optional(string)
            country_code      = optional(string)
            email             = optional(string)
            fax               = optional(string)
            first_name        = optional(string)
            last_name         = optional(string)
            organization_name = optional(string)
            phone_number      = optional(string)
            state             = optional(string)
            zip_code          = optional(string)
            extra_param       = optional(list(object({
                name  = string
                value = string
            })))
        })))
    registrant_contact = optional(list(object({
            address_line_1    = optional(string)
            address_line_2    = optional(string)
            city              = optional(string)
            contact_type      = optional(string)
            country_code      = optional(string)
            email             = optional(string)
            fax               = optional(string)
            first_name        = optional(string)
            last_name         = optional(string)
            organization_name = optional(string)
            phone_number      = optional(string)
            state             = optional(string)
            zip_code          = optional(string)
            extra_param       = optional(list(object({
                name  = string
                value = string
            })))
        })))
    tech_contact       = optional(list(object({
            address_line_1    = optional(string)
            address_line_2    = optional(string)
            city              = optional(string)
            contact_type      = optional(string)
            country_code      = optional(string)
            email             = optional(string)
            fax               = optional(string)
            first_name        = optional(string)
            last_name         = optional(string)
            organization_name = optional(string)
            phone_number      = optional(string)
            state             = optional(string)
            zip_code          = optional(string)
            extra_param       = optional(list(object({
                name  = string
                value = string
            })))
        })))
  }))
}
