resource "aws_transfer_ssh_key" "transfer_ssh_keys" {
  for_each = var.transfer_ssh_keys

  body      = each.value.body
  server_id = each.value.server_id
  user_name = each.value.user_name
  region    = each.value.region
}
