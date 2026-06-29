variable "bedrockagentcore_agent_runtime_endpoints" {
  description = <<EOT
Map of bedrockagentcore_agent_runtime_endpoints, attributes below
Required:
    - agent_runtime_id
    - name
Optional:
    - agent_runtime_version
    - description
    - region
    - tags
EOT

  type = map(object({
    agent_runtime_id      = string
    name                  = string
    agent_runtime_version = optional(string)
    description           = optional(string)
    region                = optional(string)
    tags                  = optional(map(string))
  }))
}
