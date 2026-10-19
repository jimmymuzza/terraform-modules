variable "bedrockagent_agent_alias" {
  description = <<EOT
Map of bedrockagent_agent_alias, attributes below
Required:
    - agent_alias_name
    - agent_id
Optional:
    - description
    - region
    - routing_configuration
    - tags
EOT

  type = map(object({
    agent_alias_name      = string
    agent_id              = string
    description           = optional(string)
    region                = optional(string)
    routing_configuration = optional(list(object({
            agent_version = string
            provisioned_throughput = string
        })))
    tags                  = optional(map(string))
  }))
}
