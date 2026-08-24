resource "aws_secretsmanager_secret_rotation" "secretsmanager_secret_rotations" {
  for_each = var.secretsmanager_secret_rotations

  secret_id                         = each.value.secret_id
  external_secret_rotation_role_arn = each.value.external_secret_rotation_role_arn
  region                            = each.value.region
  rotate_immediately                = each.value.rotate_immediately
  rotation_lambda_arn               = each.value.rotation_lambda_arn

  dynamic "external_secret_rotation_metadata" {
    for_each = each.value.external_secret_rotation_metadata != null ? each.value.external_secret_rotation_metadata : []
    content {
      key   = external_secret_rotation_metadata.value.key
      value = external_secret_rotation_metadata.value.value
    }
  }

  dynamic "rotation_rules" {
    for_each = each.value.rotation_rules != null ? each.value.rotation_rules : []
    content {
      automatically_after_days = rotation_rules.value.automatically_after_days
      duration                 = rotation_rules.value.duration
      schedule_expression      = rotation_rules.value.schedule_expression
    }
  }
}
