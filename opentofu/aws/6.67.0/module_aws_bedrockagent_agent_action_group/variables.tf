variable "bedrockagent_agent_action_groups" {
  description = <<EOT
Map of bedrockagent_agent_action_groups, attributes below
Required:
    - action_group_name
    - agent_id
    - agent_version
Optional:
    - action_group_state
    - description
    - parent_action_group_signature
    - prepare_agent
    - region
    - skip_resource_in_use_check
    - action_group_executor
    - api_schema
    - function_schema
EOT

  type = map(object({
    action_group_name             = string
    agent_id                      = string
    agent_version                 = string
    action_group_state            = optional(string)
    description                   = optional(string)
    parent_action_group_signature = optional(string)
    prepare_agent                 = optional(bool)
    region                        = optional(string)
    skip_resource_in_use_check    = optional(bool)
    action_group_executor         = optional(list(object({
            custom_control = optional(string)
            lambda         = optional(string)
        })))
    api_schema                    = optional(list(object({
            payload = optional(string)
            s3      = optional(list(object({
                s3_bucket_name = optional(string)
                s3_object_key  = optional(string)
            })))
        })))
    function_schema               = optional(list(object({
            member_functions = optional(list(object({
                functions = optional(list(object({
                    name        = string
                    description = optional(string)
                    parameters  = optional(set(object({
                        map_block_key = string
                        type          = string
                        description   = optional(string)
                        required      = optional(bool)
                    })))
                })))
            })))
        })))
  }))
}
