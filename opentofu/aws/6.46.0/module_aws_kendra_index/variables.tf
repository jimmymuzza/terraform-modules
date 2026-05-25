variable "kendra_indexes" {
  description = <<EOT
Map of kendra_indexes, attributes below
Required:
    - name
    - role_arn
Optional:
    - description
    - edition
    - region
    - tags
    - tags_all
    - user_context_policy
    - capacity_units
    - document_metadata_configuration_updates
    - server_side_encryption_configuration
    - user_group_resolution_configuration
    - user_token_configurations
EOT

  type = map(object({
    name                                    = string
    role_arn                                = string
    description                             = optional(string)
    edition                                 = optional(string)
    region                                  = optional(string)
    tags                                    = optional(map(string))
    tags_all                                = optional(map(string))
    user_context_policy                     = optional(string)
    capacity_units                          = optional(list(object({
            query_capacity_units   = optional(number)
            storage_capacity_units = optional(number)
        })))
    document_metadata_configuration_updates = optional(set(object({
            name      = string
            type      = string
            relevance = optional(list(object({
                duration              = optional(string)
                freshness             = optional(bool)
                importance            = optional(number)
                rank_order            = optional(string)
                values_importance_map = optional(map(number))
            })))
            search    = optional(list(object({
                displayable = optional(bool)
                facetable   = optional(bool)
                searchable  = optional(bool)
                sortable    = optional(bool)
            })))
        })))
    server_side_encryption_configuration    = optional(list(object({
            kms_key_id = optional(string)
        })))
    user_group_resolution_configuration     = optional(list(object({
            user_group_resolution_mode = string
        })))
    user_token_configurations               = optional(list(object({
            json_token_type_configuration = optional(list(object({
                group_attribute_field     = string
                user_name_attribute_field = string
            })))
            jwt_token_type_configuration  = optional(list(object({
                key_location              = string
                claim_regex               = optional(string)
                group_attribute_field     = optional(string)
                issuer                    = optional(string)
                secrets_manager_arn       = optional(string)
                url                       = optional(string)
                user_name_attribute_field = optional(string)
            })))
        })))
  }))
}
