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
    - indexed_key
    - stream_delivery_resources
EOT

  type = map(object({
    event_expiry_duration     = number
    name                      = string
    description               = optional(string)
    encryption_key_arn        = optional(string)
    memory_execution_role_arn = optional(string)
    region                    = optional(string)
    tags                      = optional(map(string))
    indexed_key               = optional(set(object({
            key  = string
            type = string
        })))
    stream_delivery_resources = optional(list(object({
            resource = optional(list(object({
                kinesis = optional(list(object({
                    data_stream_arn       = string
                    content_configuration = optional(list(object({
                        type  = string
                        level = optional(string)
                    })))
                })))
            })))
        })))
  }))
}
