variable "bedrockagent_agent_knowledge_base_associations" {
  description = <<EOT
Map of bedrockagent_agent_knowledge_base_associations, attributes below
Required:
    - agent_id
    - description
    - knowledge_base_id
    - knowledge_base_state
Optional:
    - agent_version
    - region
EOT

  type = map(object({
    agent_id             = string
    description          = string
    knowledge_base_id    = string
    knowledge_base_state = string
    agent_version        = optional(string)
    region               = optional(string)
  }))
}
