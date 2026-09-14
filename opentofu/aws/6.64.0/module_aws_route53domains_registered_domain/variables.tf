variable "route53domains_registered_domains" {
  description = <<EOT
Map of route53domains_registered_domains, attributes below
Required:
    - domain_name
Optional:
    - admin_privacy
    - auto_renew
    - billing_privacy
    - registrant_privacy
    - tags
    - tags_all
    - tech_privacy
    - transfer_lock
    - admin_contact
    - billing_contact
    - name_server
    - registrant_contact
    - tech_contact
EOT

  type = map(object({
    domain_name        = string
    admin_privacy      = optional(bool)
    auto_renew         = optional(bool)
    billing_privacy    = optional(bool)
    registrant_privacy = optional(bool)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    tech_privacy       = optional(bool)
    transfer_lock      = optional(bool)
    admin_contact      = optional(list(object({
            address_line_1    = optional(string)
            address_line_2    = optional(string)
            city              = optional(string)
            contact_type      = optional(string)
            country_code      = optional(string)
            email             = optional(string)
            extra_params      = optional(map(string))
            fax               = optional(string)
            first_name        = optional(string)
            last_name         = optional(string)
            organization_name = optional(string)
            phone_number      = optional(string)
            state             = optional(string)
            zip_code          = optional(string)
        })))
    billing_contact    = optional(list(object({
            address_line_1    = optional(string)
            address_line_2    = optional(string)
            city              = optional(string)
            contact_type      = optional(string)
            country_code      = optional(string)
            email             = optional(string)
            extra_params      = optional(map(string))
            fax               = optional(string)
            first_name        = optional(string)
            last_name         = optional(string)
            organization_name = optional(string)
            phone_number      = optional(string)
            state             = optional(string)
            zip_code          = optional(string)
        })))
    name_server        = optional(list(object({
            name     = string
            glue_ips = optional(set(string))
        })))
    registrant_contact = optional(list(object({
            address_line_1    = optional(string)
            address_line_2    = optional(string)
            city              = optional(string)
            contact_type      = optional(string)
            country_code      = optional(string)
            email             = optional(string)
            extra_params      = optional(map(string))
            fax               = optional(string)
            first_name        = optional(string)
            last_name         = optional(string)
            organization_name = optional(string)
            phone_number      = optional(string)
            state             = optional(string)
            zip_code          = optional(string)
        })))
    tech_contact       = optional(list(object({
            address_line_1    = optional(string)
            address_line_2    = optional(string)
            city              = optional(string)
            contact_type      = optional(string)
            country_code      = optional(string)
            email             = optional(string)
            extra_params      = optional(map(string))
            fax               = optional(string)
            first_name        = optional(string)
            last_name         = optional(string)
            organization_name = optional(string)
            phone_number      = optional(string)
            state             = optional(string)
            zip_code          = optional(string)
        })))
  }))
}
