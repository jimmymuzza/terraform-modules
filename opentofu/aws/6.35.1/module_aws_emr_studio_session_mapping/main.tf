resource "aws_emr_studio_session_mapping" "emr_studio_session_mappings" {
  for_each = var.emr_studio_session_mappings

  identity_type      = each.value.identity_type
  session_policy_arn = each.value.session_policy_arn
  studio_id          = each.value.studio_id
  identity_id        = each.value.identity_id
  identity_name      = each.value.identity_name
  region             = each.value.region
}
