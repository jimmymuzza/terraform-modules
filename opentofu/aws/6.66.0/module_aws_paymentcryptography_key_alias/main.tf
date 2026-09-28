resource "aws_paymentcryptography_key_alias" "paymentcryptography_key_alias" {
  for_each = var.paymentcryptography_key_alias

  alias_name = each.value.alias_name
  key_arn    = each.value.key_arn
  region     = each.value.region
}
