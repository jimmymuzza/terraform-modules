variable "stack_hci_clusters" {
  description = <<EOT
Map of stack_hci_clusters, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - automanage_configuration_id
    - client_id
    - tags
    - tenant_id
    - identity
EOT

  type = map(object({
    location                    = string
    name                        = string
    resource_group_name         = string
    automanage_configuration_id = optional(string)
    client_id                   = optional(string)
    tags                        = optional(map(string))
    tenant_id                   = optional(string)
    identity                    = optional(list(object({
            type = string
        })))
  }))
}
