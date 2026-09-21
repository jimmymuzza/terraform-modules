variable "bedrockagentcore_gateway_rules" {
  description = <<EOT
Map of bedrockagentcore_gateway_rules, attributes below
Required:
    - gateway_identifier
    - priority
Optional:
    - description
    - region
    - action
    - condition
EOT

  type = map(object({
    gateway_identifier = string
    priority           = number
    description        = optional(string)
    region             = optional(string)
    action             = optional(list(object({
            configuration_bundle = optional(list(object({
                static_override   = optional(list(object({
                    bundle_arn     = string
                    bundle_version = string
                })))
                weighted_override = optional(list(object({
                    traffic_split = optional(list(object({
                        name                 = string
                        weight               = number
                        description          = optional(string)
                        metadata             = optional(map(string))
                        configuration_bundle = optional(list(object({
                            bundle_arn     = string
                            bundle_version = string
                        })))
                    })))
                })))
            })))
            route_to_target      = optional(list(object({
                static_route   = optional(list(object({
                    target_name = string
                })))
                weighted_route = optional(list(object({
                    traffic_split = optional(list(object({
                        name        = string
                        target_name = string
                        weight      = number
                        description = optional(string)
                        metadata    = optional(map(string))
                    })))
                })))
            })))
        })))
    condition          = optional(list(object({
            match_paths      = optional(list(object({
                any_of = list(string)
            })))
            match_principals = optional(list(object({
                any_of = optional(list(object({
                    iam_principal = optional(list(object({
                        arn      = string
                        operator = optional(string)
                    })))
                })))
            })))
        })))
  }))
}
