variable "networkmanager_prefix_list_associations" {
  description = <<EOT
Map of networkmanager_prefix_list_associations, attributes below
Required:
    - core_network_id
    - prefix_list_alias
    - prefix_list_arn
EOT

  type = map(object({
    core_network_id   = string
    prefix_list_alias = string
    prefix_list_arn   = string
  }))
}
