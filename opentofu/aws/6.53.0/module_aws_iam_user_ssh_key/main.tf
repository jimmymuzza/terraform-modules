resource "aws_iam_user_ssh_key" "iam_user_ssh_keys" {
  for_each = var.iam_user_ssh_keys

  encoding   = each.value.encoding
  public_key = each.value.public_key
  username   = each.value.username
  status     = each.value.status
}
