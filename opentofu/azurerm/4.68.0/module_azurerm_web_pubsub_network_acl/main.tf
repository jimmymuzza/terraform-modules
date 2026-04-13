resource "azurerm_web_pubsub_network_acl" "web_pubsub_network_acls" {
  for_each = var.web_pubsub_network_acls

  web_pubsub_id  = each.value.web_pubsub_id
  default_action = each.value.default_action

  dynamic "private_endpoint" {
    for_each = each.value.private_endpoint != null ? each.value.private_endpoint : []
    content {
      allowed_request_types = private_endpoint.value.allowed_request_types
      denied_request_types  = private_endpoint.value.denied_request_types
    }
  }

  dynamic "public_network" {
    for_each = each.value.public_network != null ? each.value.public_network : []
    content {
      allowed_request_types = public_network.value.allowed_request_types
      denied_request_types  = public_network.value.denied_request_types
    }
  }
}
