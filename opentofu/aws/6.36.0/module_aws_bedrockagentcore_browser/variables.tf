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
    - network_configuration
    - recording
EOT

  type = map(object({
    name                  = string
    description           = optional(string)
    execution_role_arn    = optional(string)
    region                = optional(string)
    tags                  = optional(map(string))
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
