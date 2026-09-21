variable "sfn_alias" {
  description = <<EOT
Map of sfn_alias, attributes below
Required:
    - name
    - routing_configuration
Optional:
    - description
    - region
EOT

  type = map(object({
    name                  = string
    description           = optional(string)
    region                = optional(string)
    routing_configuration = list(object({
            state_machine_version_arn = string
            weight                    = number
        }))
  }))
}
