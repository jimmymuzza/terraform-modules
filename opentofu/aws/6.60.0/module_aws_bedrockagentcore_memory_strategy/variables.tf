variable "bedrockagentcore_memory_strategies" {
  description = <<EOT
Map of bedrockagentcore_memory_strategies, attributes below
Required:
    - memory_id
    - name
    - type
Optional:
    - description
    - memory_execution_role_arn
    - namespace_templates
    - namespaces
    - region
    - configuration
    - reflection_configuration
EOT

  type = map(object({
    memory_id                 = string
    name                      = string
    type                      = string
    description               = optional(string)
    memory_execution_role_arn = optional(string)
    namespace_templates       = optional(set(string))
    namespaces                = optional(set(string))
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
            reflection    = optional(list(object({
                append_to_prompt    = string
                model_id            = string
                namespace_templates = set(string)
            })))
        })))
    reflection_configuration  = optional(list(object({
            namespace_templates = set(string)
        })))
  }))
}
