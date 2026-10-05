resource "aws_shield_application_layer_automatic_response" "shield_application_layer_automatic_responses" {
  for_each = var.shield_application_layer_automatic_responses

  action       = each.value.action
  resource_arn = each.value.resource_arn
}
