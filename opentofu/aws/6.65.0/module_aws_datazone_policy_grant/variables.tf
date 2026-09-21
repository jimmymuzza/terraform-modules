variable "datazone_policy_grants" {
  description = <<EOT
Map of datazone_policy_grants, attributes below
Required:
    - domain_identifier
    - entity_identifier
    - entity_type
    - policy_type
Optional:
    - region
    - detail
    - principal
EOT

  type = map(object({
    domain_identifier = string
    entity_identifier = string
    entity_type       = string
    policy_type       = string
    region            = optional(string)
    detail            = optional(list(object({
            add_to_project_member_pool          = optional(list(object({
                include_child_domain_units = optional(bool)
            })))
            create_asset_type                   = optional(list(object({
                include_child_domain_units = optional(bool)
            })))
            create_domain_unit                  = optional(list(object({
                include_child_domain_units = optional(bool)
            })))
            create_environment                  = optional(list(object({

            })))
            create_environment_from_blueprint   = optional(list(object({

            })))
            create_environment_profile          = optional(list(object({
                domain_unit_id = optional(string)
            })))
            create_form_type                    = optional(list(object({
                include_child_domain_units = optional(bool)
            })))
            create_glossary                     = optional(list(object({
                include_child_domain_units = optional(bool)
            })))
            create_project                      = optional(list(object({
                include_child_domain_units = optional(bool)
            })))
            create_project_from_project_profile = optional(list(object({
                include_child_domain_units = optional(bool)
                project_profiles           = optional(list(string))
            })))
            delegate_create_environment_profile = optional(list(object({

            })))
            override_domain_unit_owners         = optional(list(object({
                include_child_domain_units = optional(bool)
            })))
            override_project_owners             = optional(list(object({
                include_child_domain_units = optional(bool)
            })))
            use_asset_type                      = optional(list(object({
                domain_unit_id = optional(string)
            })))
        })))
    principal         = optional(list(object({
            domain_unit = optional(list(object({
                domain_unit_designation       = string
                domain_unit_identifier        = optional(string)
                all_domain_units_grant_filter = optional(list(object({

                })))
            })))
            group       = optional(list(object({
                group_identifier = string
            })))
            project     = optional(list(object({
                project_designation = string
                project_identifier  = optional(string)
                domain_unit_filter  = optional(list(object({
                    domain_unit                = string
                    include_child_domain_units = optional(bool)
                })))
            })))
            user        = optional(list(object({
                user_identifier        = optional(string)
                all_users_grant_filter = optional(list(object({

                })))
            })))
        })))
  }))
}
