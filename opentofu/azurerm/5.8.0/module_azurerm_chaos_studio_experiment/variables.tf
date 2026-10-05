variable "chaos_studio_experiments" {
  description = <<EOT
Map of chaos_studio_experiments, attributes below
Required:
    - location
    - name
    - resource_group_name
    - selectors
    - steps
Optional:
    - identity
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    identity            = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    selectors           = list(object({
            chaos_studio_target_ids = list(string)
            name                    = string
        }))
    steps               = list(object({
            name   = string
            branch = list(object({
                name    = string
                actions = list(object({
                    action_type   = string
                    duration      = optional(string)
                    parameters    = optional(map(string))
                    selector_name = optional(string)
                    urn           = optional(string)
                }))
            }))
        }))
  }))
}
