variable "bedrockagent_agents" {
  description = <<EOT
Map of bedrockagent_agents, attributes below
Required:
    - agent_name
    - agent_resource_role_arn
    - foundation_model
Optional:
    - agent_collaboration
    - customer_encryption_key_arn
    - description
    - guardrail_configuration
    - idle_session_ttl_in_seconds
    - instruction
    - memory_configuration
    - prepare_agent
    - prompt_override_configuration
    - region
    - skip_resource_in_use_check
    - tags
EOT

  type = map(object({
    agent_name                    = string
    agent_resource_role_arn       = string
    foundation_model              = string
    agent_collaboration           = optional(string)
    customer_encryption_key_arn   = optional(string)
    description                   = optional(string)
    guardrail_configuration       = optional(list(object({
            guardrail_identifier = string
            guardrail_version = string
        })))
    idle_session_ttl_in_seconds   = optional(number)
    instruction                   = optional(string)
    memory_configuration          = optional(list(object({
            enabled_memory_types = list(string)
            session_summary_configuration = list(object({
                max_recent_sessions = number
            }))
            storage_days = number
        })))
    prepare_agent                 = optional(bool)
    prompt_override_configuration = optional(list(object({
            override_lambda = string
            prompt_configurations = set(object({
                base_prompt_template = string
                inference_configuration = list(object({
                    max_length = number
                    stop_sequences = list(string)
                    temperature = number
                    top_k = number
                    top_p = number
                }))
                parser_mode = string
                prompt_creation_mode = string
                prompt_state = string
                prompt_type = string
            }))
        })))
    region                        = optional(string)
    skip_resource_in_use_check    = optional(bool)
    tags                          = optional(map(string))
  }))
}
