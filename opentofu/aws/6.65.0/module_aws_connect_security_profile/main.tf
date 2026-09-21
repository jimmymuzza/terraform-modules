resource "aws_connect_security_profile" "connect_security_profiles" {
  for_each = var.connect_security_profiles

  instance_id = each.value.instance_id
  name        = each.value.name
  description = each.value.description
  permissions = each.value.permissions
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
