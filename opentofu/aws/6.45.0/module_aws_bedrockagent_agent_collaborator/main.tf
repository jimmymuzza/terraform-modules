resource "aws_bedrockagent_agent_collaborator" "bedrockagent_agent_collaborators" {
  for_each = var.bedrockagent_agent_collaborators

  agent_id                   = each.value.agent_id
  collaboration_instruction  = each.value.collaboration_instruction
  collaborator_name          = each.value.collaborator_name
  agent_version              = each.value.agent_version
  prepare_agent              = each.value.prepare_agent
  region                     = each.value.region
  relay_conversation_history = each.value.relay_conversation_history

  dynamic "agent_descriptor" {
    for_each = each.value.agent_descriptor != null ? each.value.agent_descriptor : []
    content {
      alias_arn = agent_descriptor.value.alias_arn
    }
  }
}
