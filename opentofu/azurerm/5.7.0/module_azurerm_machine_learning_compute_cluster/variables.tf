variable "machine_learning_compute_clusters" {
  description = <<EOT
Map of machine_learning_compute_clusters, attributes below
Required:
    - location
    - machine_learning_workspace_id
    - name
    - vm_priority
    - vm_size
    - scale_settings
Optional:
    - description
    - local_auth_enabled
    - node_public_ip_enabled
    - ssh_public_access_enabled
    - subnet_resource_id
    - tags
    - identity
    - ssh
EOT

  type = map(object({
    location                      = string
    machine_learning_workspace_id = string
    name                          = string
    vm_priority                   = string
    vm_size                       = string
    description                   = optional(string)
    local_auth_enabled            = optional(bool)
    node_public_ip_enabled        = optional(bool)
    ssh_public_access_enabled     = optional(bool)
    subnet_resource_id            = optional(string)
    tags                          = optional(map(string))
    identity                      = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    scale_settings                = list(object({
            max_node_count                       = number
            min_node_count                       = number
            scale_down_nodes_after_idle_duration = string
        }))
    ssh                           = optional(list(object({
            admin_username = string
            admin_password = optional(string)
            key_value      = optional(string)
        })))
  }))
}
