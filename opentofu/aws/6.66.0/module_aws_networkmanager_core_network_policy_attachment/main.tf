resource "aws_networkmanager_core_network_policy_attachment" "networkmanager_core_network_policy_attachments" {
  for_each = var.networkmanager_core_network_policy_attachments

  core_network_id = each.value.core_network_id
  policy_document = each.value.policy_document
}
