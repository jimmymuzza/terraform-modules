resource "aws_iam_access_key" "iam_access_keys" {
  for_each = var.iam_access_keys

  user    = each.value.user
  pgp_key = each.value.pgp_key
  status  = each.value.status
}
