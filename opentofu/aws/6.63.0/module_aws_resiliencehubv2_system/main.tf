resource "aws_resiliencehubv2_system" "resiliencehubv2_systems" {
  for_each = var.resiliencehubv2_systems

  name            = each.value.name
  description     = each.value.description
  kms_key_id      = each.value.kms_key_id
  region          = each.value.region
  sharing_enabled = each.value.sharing_enabled
  tags            = each.value.tags
}
