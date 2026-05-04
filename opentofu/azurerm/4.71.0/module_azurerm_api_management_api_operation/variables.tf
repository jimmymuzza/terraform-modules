variable "api_management_api_operations" {
  description = <<EOT
Map of api_management_api_operations, attributes below
Required:
    - api_management_name
    - api_name
    - display_name
    - method
    - operation_id
    - resource_group_name
    - url_template
Optional:
    - description
    - request
    - response
    - template_parameter
EOT

  type = map(object({
    api_management_name = string
    api_name            = string
    display_name        = string
    method              = string
    operation_id        = string
    resource_group_name = string
    url_template        = string
    description         = optional(string)
    request             = optional(list(object({
            description     = optional(string)
            header          = optional(list(object({
                name          = string
                required      = bool
                type          = string
                default_value = optional(string)
                description   = optional(string)
                schema_id     = optional(string)
                type_name     = optional(string)
                values        = optional(set(string))
                example       = optional(list(object({
                    name           = string
                    description    = optional(string)
                    external_value = optional(string)
                    summary        = optional(string)
                    value          = optional(string)
                })))
            })))
            query_parameter = optional(list(object({
                name          = string
                required      = bool
                type          = string
                default_value = optional(string)
                description   = optional(string)
                schema_id     = optional(string)
                type_name     = optional(string)
                values        = optional(set(string))
                example       = optional(list(object({
                    name           = string
                    description    = optional(string)
                    external_value = optional(string)
                    summary        = optional(string)
                    value          = optional(string)
                })))
            })))
            representation  = optional(list(object({
                content_type   = string
                schema_id      = optional(string)
                type_name      = optional(string)
                example        = optional(list(object({
                    name           = string
                    description    = optional(string)
                    external_value = optional(string)
                    summary        = optional(string)
                    value          = optional(string)
                })))
                form_parameter = optional(list(object({
                    name          = string
                    required      = bool
                    type          = string
                    default_value = optional(string)
                    description   = optional(string)
                    schema_id     = optional(string)
                    type_name     = optional(string)
                    values        = optional(set(string))
                    example       = optional(list(object({
                        name           = string
                        description    = optional(string)
                        external_value = optional(string)
                        summary        = optional(string)
                        value          = optional(string)
                    })))
                })))
            })))
        })))
    response            = optional(list(object({
            status_code    = number
            description    = optional(string)
            header         = optional(list(object({
                name          = string
                required      = bool
                type          = string
                default_value = optional(string)
                description   = optional(string)
                schema_id     = optional(string)
                type_name     = optional(string)
                values        = optional(set(string))
                example       = optional(list(object({
                    name           = string
                    description    = optional(string)
                    external_value = optional(string)
                    summary        = optional(string)
                    value          = optional(string)
                })))
            })))
            representation = optional(list(object({
                content_type   = string
                schema_id      = optional(string)
                type_name      = optional(string)
                example        = optional(list(object({
                    name           = string
                    description    = optional(string)
                    external_value = optional(string)
                    summary        = optional(string)
                    value          = optional(string)
                })))
                form_parameter = optional(list(object({
                    name          = string
                    required      = bool
                    type          = string
                    default_value = optional(string)
                    description   = optional(string)
                    schema_id     = optional(string)
                    type_name     = optional(string)
                    values        = optional(set(string))
                    example       = optional(list(object({
                        name           = string
                        description    = optional(string)
                        external_value = optional(string)
                        summary        = optional(string)
                        value          = optional(string)
                    })))
                })))
            })))
        })))
    template_parameter  = optional(list(object({
            name          = string
            required      = bool
            type          = string
            default_value = optional(string)
            description   = optional(string)
            schema_id     = optional(string)
            type_name     = optional(string)
            values        = optional(set(string))
            example       = optional(list(object({
                name           = string
                description    = optional(string)
                external_value = optional(string)
                summary        = optional(string)
                value          = optional(string)
            })))
        })))
  }))
}
