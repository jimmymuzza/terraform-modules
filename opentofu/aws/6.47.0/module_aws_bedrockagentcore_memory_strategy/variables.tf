variable "bedrockagentcore_memory_strategies" {
  description = <<EOT
Map of bedrockagentcore_memory_strategies, attributes below
Required:
    - memory_id
    - name
    - namespaces
    - type
Optional:
    - description
    - memory_execution_role_arn
    - region
    - configuration
EOT

  type = map(object({
    memory_id                 = string
    name                      = string
    namespaces                = set(string)
    type                      = string
    description               = optional(string)
    memory_execution_role_arn = optional(string)
    region                    = optional(string)
    configuration             = optional(list(object({
            type          = string
            consolidation = optional(list(object({
                append_to_prompt = string
                model_id         = string
            })))
            extraction    = optional(list(object({
                append_to_prompt = string
                model_id         = string
            })))
        })))
  }))
}
