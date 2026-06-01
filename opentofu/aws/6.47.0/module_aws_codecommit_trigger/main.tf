resource "aws_codecommit_trigger" "codecommit_triggers" {
  for_each = var.codecommit_triggers

  repository_name = each.value.repository_name
  region          = each.value.region

  dynamic "trigger" {
    for_each = each.value.trigger != null ? each.value.trigger : []
    content {
      destination_arn = trigger.value.destination_arn
      events          = trigger.value.events
      name            = trigger.value.name
      branches        = trigger.value.branches
      custom_data     = trigger.value.custom_data
    }
  }
}
