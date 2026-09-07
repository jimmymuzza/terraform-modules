resource "aws_elasticache_user" "elasticache_users" {
  for_each = var.elasticache_users

  access_string        = each.value.access_string
  engine               = each.value.engine
  user_id              = each.value.user_id
  user_name            = each.value.user_name
  no_password_required = each.value.no_password_required
  passwords            = each.value.passwords
  passwords_wo         = each.value.passwords_wo
  passwords_wo_version = each.value.passwords_wo_version
  region               = each.value.region
  tags                 = each.value.tags
  tags_all             = each.value.tags_all

  dynamic "authentication_mode" {
    for_each = each.value.authentication_mode != null ? each.value.authentication_mode : []
    content {
      type      = authentication_mode.value.type
      passwords = authentication_mode.value.passwords
    }
  }
}
