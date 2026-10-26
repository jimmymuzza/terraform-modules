resource "aws_bedrockagent_agent_knowledge_base_association" "bedrockagent_agent_knowledge_base_associations" {
  for_each = var.bedrockagent_agent_knowledge_base_associations

  agent_id             = each.value.agent_id
  description          = each.value.description
  knowledge_base_id    = each.value.knowledge_base_id
  knowledge_base_state = each.value.knowledge_base_state
  agent_version        = each.value.agent_version
  region               = each.value.region
}
