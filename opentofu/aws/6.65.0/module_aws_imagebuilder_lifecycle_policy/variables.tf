variable "imagebuilder_lifecycle_policies" {
  description = <<EOT
Map of imagebuilder_lifecycle_policies, attributes below
Required:
    - execution_role
    - name
    - resource_type
Optional:
    - description
    - region
    - status
    - tags
    - policy_detail
    - resource_selection
EOT

  type = map(object({
    execution_role     = string
    name               = string
    resource_type      = string
    description        = optional(string)
    region             = optional(string)
    status             = optional(string)
    tags               = optional(map(string))
    policy_detail      = optional(set(object({
            action          = optional(list(object({
                type              = string
                include_resources = optional(list(object({
                    amis       = optional(bool)
                    containers = optional(bool)
                    snapshots  = optional(bool)
                })))
            })))
            exclusion_rules = optional(list(object({
                tag_map = optional(map(string))
                amis    = optional(list(object({
                    is_public       = optional(bool)
                    regions         = optional(list(string))
                    shared_accounts = optional(list(string))
                    tag_map         = optional(map(string))
                    last_launched   = optional(list(object({
                        unit  = string
                        value = number
                    })))
                })))
            })))
            filter          = optional(list(object({
                type            = string
                value           = number
                retain_at_least = optional(number)
                unit            = optional(string)
            })))
        })))
    resource_selection = optional(list(object({
            tag_map = optional(map(string))
            recipe  = optional(set(object({
                name             = string
                semantic_version = string
            })))
        })))
  }))
}
