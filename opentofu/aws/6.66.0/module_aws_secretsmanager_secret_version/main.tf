resource "aws_secretsmanager_secret_version" "secretsmanager_secret_versions" {
  for_each = var.secretsmanager_secret_versions

  secret_id                = each.value.secret_id
  region                   = each.value.region
  secret_binary            = each.value.secret_binary
  secret_string            = each.value.secret_string
  secret_string_wo         = each.value.secret_string_wo
  secret_string_wo_version = each.value.secret_string_wo_version
  version_stages           = each.value.version_stages
}
