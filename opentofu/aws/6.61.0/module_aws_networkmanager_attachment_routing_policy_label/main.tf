resource "aws_networkmanager_attachment_routing_policy_label" "networkmanager_attachment_routing_policy_labels" {
  for_each = var.networkmanager_attachment_routing_policy_labels

  attachment_id        = each.value.attachment_id
  core_network_id      = each.value.core_network_id
  routing_policy_label = each.value.routing_policy_label
}
