variable "machine_learning_compute_instances" {
  description = <<EOT
Map of machine_learning_compute_instances, attributes below
Required:
    - machine_learning_workspace_id
    - name
    - virtual_machine_size
Optional:
    - authorization_type
    - description
    - local_auth_enabled
    - node_public_ip_enabled
    - subnet_resource_id
    - tags
    - assign_to_user
    - identity
    - ssh
EOT

  type = map(object({
    machine_learning_workspace_id = string
    name                          = string
    virtual_machine_size          = string
    authorization_type            = optional(string)
    description                   = optional(string)
    local_auth_enabled            = optional(bool)
    node_public_ip_enabled        = optional(bool)
    subnet_resource_id            = optional(string)
    tags                          = optional(map(string))
    assign_to_user                = optional(list(object({
            object_id = optional(string)
            tenant_id = optional(string)
        })))
    identity                      = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    ssh                           = optional(list(object({
            public_key = string
        })))
  }))
}
