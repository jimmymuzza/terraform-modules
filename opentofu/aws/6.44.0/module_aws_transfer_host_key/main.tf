resource "aws_transfer_host_key" "transfer_host_keys" {
  for_each = var.transfer_host_keys

  server_id        = each.value.server_id
  description      = each.value.description
  host_key_body    = each.value.host_key_body
  host_key_body_wo = each.value.host_key_body_wo
  region           = each.value.region
  tags             = each.value.tags
}
