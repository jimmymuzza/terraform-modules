variable "vpclattice_listener_rules" {
  description = <<EOT
Map of vpclattice_listener_rules, attributes below
Required:
    - listener_identifier
    - name
    - priority
    - service_identifier
    - action
    - match
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    listener_identifier = string
    name                = string
    priority            = number
    service_identifier  = string
    region              = optional(string)
    tags                = optional(map(string))
    tags_all            = optional(map(string))
    action              = list(object({
            fixed_response = optional(list(object({
                status_code = number
            })))
            forward        = optional(list(object({
                target_groups = list(object({
                    target_group_identifier = string
                    weight                  = optional(number)
                }))
            })))
        }))
    match               = list(object({
            http_match = list(object({
                method         = optional(string)
                header_matches = optional(list(object({
                    name           = string
                    case_sensitive = optional(bool)
                    match          = list(object({
                        contains = optional(string)
                        exact    = optional(string)
                        prefix   = optional(string)
                    }))
                })))
                path_match     = optional(list(object({
                    case_sensitive = optional(bool)
                    match          = list(object({
                        exact  = optional(string)
                        prefix = optional(string)
                    }))
                })))
            }))
        }))
  }))
}
