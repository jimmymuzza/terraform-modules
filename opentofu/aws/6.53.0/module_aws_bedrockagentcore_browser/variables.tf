variable "bedrockagentcore_browsers" {
  description = <<EOT
Map of bedrockagentcore_browsers, attributes below
Required:
    - name
Optional:
    - description
    - execution_role_arn
    - region
    - tags
    - browser_signing
    - certificate
    - enterprise_policy
    - network_configuration
    - recording
EOT

  type = map(object({
    name                  = string
    description           = optional(string)
    execution_role_arn    = optional(string)
    region                = optional(string)
    tags                  = optional(map(string))
    browser_signing       = optional(list(object({
            enabled = bool
        })))
    certificate           = optional(list(object({
            location = optional(list(object({
                secrets_manager = optional(list(object({
                    secret_arn = string
                })))
            })))
        })))
    enterprise_policy     = optional(list(object({
            type     = optional(string)
            location = optional(list(object({
                s3 = optional(list(object({
                    bucket     = string
                    prefix     = string
                    version_id = optional(string)
                })))
            })))
        })))
    network_configuration = optional(list(object({
            network_mode = string
            vpc_config   = optional(list(object({
                security_groups = set(string)
                subnets         = set(string)
            })))
        })))
    recording             = optional(list(object({
            enabled     = optional(bool)
            s3_location = optional(list(object({
                bucket = string
                prefix = string
            })))
        })))
  }))
}
