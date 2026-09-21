variable "vpclattice_listeners" {
  description = <<EOT
Map of vpclattice_listeners, attributes below
Required:
    - name
    - protocol
    - default_action
Optional:
    - port
    - region
    - service_arn
    - service_identifier
    - tags
    - tags_all
EOT

  type = map(object({
    name               = string
    protocol           = string
    port               = optional(number)
    region             = optional(string)
    service_arn        = optional(string)
    service_identifier = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    default_action     = list(object({
            fixed_response = optional(list(object({
                status_code = number
            })))
            forward        = optional(list(object({
                target_groups = optional(list(object({
                    target_group_identifier = optional(string)
                    weight                  = optional(number)
                })))
            })))
        }))
  }))
}
