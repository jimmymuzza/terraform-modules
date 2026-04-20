variable "securityhub_configuration_policies" {
  description = <<EOT
Map of securityhub_configuration_policies, attributes below
Required:
    - name
    - configuration_policy
Optional:
    - description
    - region
EOT

  type = map(object({
    name                 = string
    description          = optional(string)
    region               = optional(string)
    configuration_policy = list(object({
            service_enabled                 = bool
            enabled_standard_arns           = optional(set(string))
            security_controls_configuration = optional(list(object({
                disabled_control_identifiers      = optional(set(string))
                enabled_control_identifiers       = optional(set(string))
                security_control_custom_parameter = optional(list(object({
                    security_control_id = string
                    parameter           = set(object({
                        name        = string
                        value_type  = string
                        bool        = optional(list(object({
                            value = bool
                        })))
                        double      = optional(list(object({
                            value = number
                        })))
                        enum        = optional(list(object({
                            value = string
                        })))
                        enum_list   = optional(list(object({
                            value = list(string)
                        })))
                        int         = optional(list(object({
                            value = number
                        })))
                        int_list    = optional(list(object({
                            value = list(number)
                        })))
                        string      = optional(list(object({
                            value = string
                        })))
                        string_list = optional(list(object({
                            value = list(string)
                        })))
                    }))
                })))
            })))
        }))
  }))
}
