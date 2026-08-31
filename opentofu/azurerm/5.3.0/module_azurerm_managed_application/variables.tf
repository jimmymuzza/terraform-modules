variable "managed_applications" {
  description = <<EOT
Map of managed_applications, attributes below
Required:
    - kind
    - location
    - managed_resource_group_name
    - name
    - resource_group_name
Optional:
    - application_definition_id
    - parameter_values
    - tags
    - identity
    - plan
EOT

  type = map(object({
    kind                        = string
    location                    = string
    managed_resource_group_name = string
    name                        = string
    resource_group_name         = string
    application_definition_id   = optional(string)
    parameter_values            = optional(string)
    tags                        = optional(map(string))
    identity                    = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    plan                        = optional(list(object({
            name           = string
            product        = string
            publisher      = string
            version        = string
            promotion_code = optional(string)
        })))
  }))
}
