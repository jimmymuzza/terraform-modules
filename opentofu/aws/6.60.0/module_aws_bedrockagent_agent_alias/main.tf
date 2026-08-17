resource "aws_bedrockagent_agent_alias" "bedrockagent_agent_alias" {
  for_each = var.bedrockagent_agent_alias

  agent_alias_name      = each.value.agent_alias_name
  agent_id              = each.value.agent_id
  description           = each.value.description
  region                = each.value.region
  routing_configuration = each.value.routing_configuration
  tags                  = each.value.tags
}
