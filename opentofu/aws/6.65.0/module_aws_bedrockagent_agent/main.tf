resource "aws_bedrockagent_agent" "bedrockagent_agents" {
  for_each = var.bedrockagent_agents

  agent_name                    = each.value.agent_name
  agent_resource_role_arn       = each.value.agent_resource_role_arn
  foundation_model              = each.value.foundation_model
  agent_collaboration           = each.value.agent_collaboration
  customer_encryption_key_arn   = each.value.customer_encryption_key_arn
  description                   = each.value.description
  guardrail_configuration       = each.value.guardrail_configuration
  idle_session_ttl_in_seconds   = each.value.idle_session_ttl_in_seconds
  instruction                   = each.value.instruction
  memory_configuration          = each.value.memory_configuration
  prepare_agent                 = each.value.prepare_agent
  prompt_override_configuration = each.value.prompt_override_configuration
  region                        = each.value.region
  skip_resource_in_use_check    = each.value.skip_resource_in_use_check
  tags                          = each.value.tags
}
