variable "networkmanager_core_networks" {
  description = <<EOT
Map of networkmanager_core_networks, attributes below
Required:
    - global_network_id
Optional:
    - base_policy_document
    - base_policy_regions
    - create_base_policy
    - description
    - tags
    - tags_all
EOT

  type = map(object({
    global_network_id    = string
    base_policy_document = optional(string)
    base_policy_regions  = optional(set(string))
    create_base_policy   = optional(bool)
    description          = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
  }))
}
