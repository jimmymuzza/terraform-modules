resource "aws_bedrockagentcore_agent_runtime_endpoint" "bedrockagentcore_agent_runtime_endpoints" {
  for_each = var.bedrockagentcore_agent_runtime_endpoints

  agent_runtime_id      = each.value.agent_runtime_id
  name                  = each.value.name
  agent_runtime_version = each.value.agent_runtime_version
  description           = each.value.description
  region                = each.value.region
  tags                  = each.value.tags
}
