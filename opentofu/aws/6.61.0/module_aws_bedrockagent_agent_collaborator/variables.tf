variable "bedrockagent_agent_collaborators" {
  description = <<EOT
Map of bedrockagent_agent_collaborators, attributes below
Required:
    - agent_id
    - collaboration_instruction
    - collaborator_name
Optional:
    - agent_version
    - prepare_agent
    - region
    - relay_conversation_history
    - agent_descriptor
EOT

  type = map(object({
    agent_id                   = string
    collaboration_instruction  = string
    collaborator_name          = string
    agent_version              = optional(string)
    prepare_agent              = optional(bool)
    region                     = optional(string)
    relay_conversation_history = optional(string)
    agent_descriptor           = optional(list(object({
            alias_arn = string
        })))
  }))
}
