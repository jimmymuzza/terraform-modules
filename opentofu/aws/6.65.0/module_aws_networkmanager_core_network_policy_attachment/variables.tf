variable "networkmanager_core_network_policy_attachments" {
  description = <<EOT
Map of networkmanager_core_network_policy_attachments, attributes below
Required:
    - core_network_id
    - policy_document
EOT

  type = map(object({
    core_network_id = string
    policy_document = string
  }))
}
