resource "aws_secretsmanager_tag" "secretsmanager_tags" {
  for_each = var.secretsmanager_tags

  key       = each.value.key
  secret_id = each.value.secret_id
  value     = each.value.value
  region    = each.value.region
}
