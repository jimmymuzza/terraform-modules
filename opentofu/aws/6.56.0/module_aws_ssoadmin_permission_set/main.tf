resource "aws_ssoadmin_permission_set" "ssoadmin_permission_sets" {
  for_each = var.ssoadmin_permission_sets

  instance_arn     = each.value.instance_arn
  name             = each.value.name
  description      = each.value.description
  region           = each.value.region
  relay_state      = each.value.relay_state
  session_duration = each.value.session_duration
  tags             = each.value.tags
  tags_all         = each.value.tags_all
}
