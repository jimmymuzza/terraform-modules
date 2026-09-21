variable "bedrockagentcore_policies" {
  description = <<EOT
Map of bedrockagentcore_policies, attributes below
Required:
    - name
    - policy_engine_id
Optional:
    - description
    - region
    - validation_mode
    - definition
EOT

  type = map(object({
    name             = string
    policy_engine_id = string
    description      = optional(string)
    region           = optional(string)
    validation_mode  = optional(string)
    definition       = optional(list(object({
            cedar = optional(list(object({
                statement = string
            })))
        })))
  }))
}
