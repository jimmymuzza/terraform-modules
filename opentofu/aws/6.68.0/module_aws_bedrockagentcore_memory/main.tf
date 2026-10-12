resource "aws_bedrockagentcore_memory" "bedrockagentcore_memories" {
  for_each = var.bedrockagentcore_memories

  event_expiry_duration     = each.value.event_expiry_duration
  name                      = each.value.name
  description               = each.value.description
  encryption_key_arn        = each.value.encryption_key_arn
  memory_execution_role_arn = each.value.memory_execution_role_arn
  region                    = each.value.region
  tags                      = each.value.tags

  dynamic "indexed_key" {
    for_each = each.value.indexed_key != null ? each.value.indexed_key : []
    content {
      key  = indexed_key.value.key
      type = indexed_key.value.type
    }
  }

  dynamic "stream_delivery_resources" {
    for_each = each.value.stream_delivery_resources != null ? each.value.stream_delivery_resources : []
    content {

      dynamic "resource" {
        for_each = stream_delivery_resources.value.resource != null ? stream_delivery_resources.value.resource : []
        content {

          dynamic "kinesis" {
            for_each = resource.value.kinesis != null ? resource.value.kinesis : []
            content {
              data_stream_arn = kinesis.value.data_stream_arn

              dynamic "content_configuration" {
                for_each = kinesis.value.content_configuration != null ? kinesis.value.content_configuration : []
                content {
                  type  = content_configuration.value.type
                  level = content_configuration.value.level
                }
              }
            }
          }
        }
      }
    }
  }
}
