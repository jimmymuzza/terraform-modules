resource "aws_bedrockagent_agent_action_group" "bedrockagent_agent_action_groups" {
  for_each = var.bedrockagent_agent_action_groups

  action_group_name             = each.value.action_group_name
  agent_id                      = each.value.agent_id
  agent_version                 = each.value.agent_version
  action_group_state            = each.value.action_group_state
  description                   = each.value.description
  parent_action_group_signature = each.value.parent_action_group_signature
  prepare_agent                 = each.value.prepare_agent
  region                        = each.value.region
  skip_resource_in_use_check    = each.value.skip_resource_in_use_check

  dynamic "action_group_executor" {
    for_each = each.value.action_group_executor != null ? each.value.action_group_executor : []
    content {
      custom_control = action_group_executor.value.custom_control
      lambda         = action_group_executor.value.lambda
    }
  }

  dynamic "api_schema" {
    for_each = each.value.api_schema != null ? each.value.api_schema : []
    content {
      payload = api_schema.value.payload

      dynamic "s3" {
        for_each = api_schema.value.s3 != null ? api_schema.value.s3 : []
        content {
          s3_bucket_name = s3.value.s3_bucket_name
          s3_object_key  = s3.value.s3_object_key
        }
      }
    }
  }

  dynamic "function_schema" {
    for_each = each.value.function_schema != null ? each.value.function_schema : []
    content {

      dynamic "member_functions" {
        for_each = function_schema.value.member_functions != null ? function_schema.value.member_functions : []
        content {

          dynamic "functions" {
            for_each = member_functions.value.functions != null ? member_functions.value.functions : []
            content {
              name        = functions.value.name
              description = functions.value.description

              dynamic "parameters" {
                for_each = functions.value.parameters != null ? functions.value.parameters : []
                content {
                  map_block_key = parameters.value.map_block_key
                  type          = parameters.value.type
                  description   = parameters.value.description
                  required      = parameters.value.required
                }
              }
            }
          }
        }
      }
    }
  }
}
