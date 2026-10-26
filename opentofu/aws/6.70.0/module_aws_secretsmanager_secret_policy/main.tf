resource "aws_secretsmanager_secret_policy" "secretsmanager_secret_policies" {
  for_each = var.secretsmanager_secret_policies

  policy              = each.value.policy
  secret_arn          = each.value.secret_arn
  block_public_policy = each.value.block_public_policy
  region              = each.value.region
}
