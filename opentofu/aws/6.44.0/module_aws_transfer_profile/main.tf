resource "aws_transfer_profile" "transfer_profiles" {
  for_each = var.transfer_profiles

  as2_id          = each.value.as2_id
  profile_type    = each.value.profile_type
  certificate_ids = each.value.certificate_ids
  region          = each.value.region
  tags            = each.value.tags
  tags_all        = each.value.tags_all
}
