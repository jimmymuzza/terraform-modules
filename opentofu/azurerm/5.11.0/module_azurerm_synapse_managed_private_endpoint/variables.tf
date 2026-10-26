variable "synapse_managed_private_endpoints" {
  description = <<EOT
Map of synapse_managed_private_endpoints, attributes below
Required:
    - name
    - subresource_name
    - synapse_workspace_id
    - target_resource_id
Optional:
    - fully_qualified_domain_names
EOT

  type = map(object({
    name                         = string
    subresource_name             = string
    synapse_workspace_id         = string
    target_resource_id           = string
    fully_qualified_domain_names = optional(list(string))
  }))
}
