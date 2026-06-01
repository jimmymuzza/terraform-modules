resource "aws_bedrockagentcore_memory" "bedrockagentcore_memories" {
  for_each = var.bedrockagentcore_memories

  event_expiry_duration     = each.value.event_expiry_duration
  name                      = each.value.name
  description               = each.value.description
  encryption_key_arn        = each.value.encryption_key_arn
  memory_execution_role_arn = each.value.memory_execution_role_arn
  region                    = each.value.region
  tags                      = each.value.tags
}
