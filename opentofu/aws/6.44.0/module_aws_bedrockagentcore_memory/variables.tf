variable "bedrockagentcore_memories" {
  description = <<EOT
Map of bedrockagentcore_memories, attributes below
Required:
    - event_expiry_duration
    - name
Optional:
    - description
    - encryption_key_arn
    - memory_execution_role_arn
    - region
    - tags
EOT

  type = map(object({
    event_expiry_duration     = number
    name                      = string
    description               = optional(string)
    encryption_key_arn        = optional(string)
    memory_execution_role_arn = optional(string)
    region                    = optional(string)
    tags                      = optional(map(string))
  }))
}
